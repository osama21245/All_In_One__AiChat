import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

abstract class AiChatControoler extends GetxController {
  StatusRequest statusRequest = StatusRequest.success;
  List messages = [];
  bool isloading = false;
  TextEditingController? messageuser;
  ScrollController scroll = ScrollController();
  late String model = "";
}

class ImpAiChatControoler extends AiChatControoler {
  scrolldown() {
    scroll.animateTo(scroll.position.minScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    update();
  }

  final apiKey = '***************************';
  final url = 'https://api.openai.com/v1/chat/completions';

  Future<String> getChatResponse(String message) async {
    isloading = true;
    update();
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      body: '''
      {
"model": "gpt-3.5-turbo",
"messages": [{"role": "user", "content": "$message"}]
,"max_tokens": 512,"top_p": 1,
"temperature": 0.5
,"frequency_penalty": 0,
"presence_penalty": 0      }
    ''',
    );

    if (response.statusCode == 200) {
      // Process and extract the generated reply from the response
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      print("============================================================");
      var reply = jsonResponse['choices'][0]['message']['content'];

      isloading = false;
      print(reply);
      return reply;
    } else {
      throw Exception('Failed to request chat response.');
    }
  }

  void sendMessage(String message) async {
    final reply = await getChatResponse(message);
    messages.add({"sender": "bot", "message": reply.toString()});
    isloading = false;

    update();
  }

  @override
  void onClose() {
    messages.clear();

    super.onClose();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    messageuser = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() async {
    super.dispose();
  }
}
