import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Widget/aichat/CustomAiChatRow.dart';
import '../Widget/aichat/CustomAiChatTextField.dart';
import '../Widget/aichat/CustomAiMessage.dart';
import '../controller/AiChatController.dart';

class AiChat extends StatelessWidget {
  const AiChat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpAiChatControoler());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 73, 22, 2),
            Color.fromRGBO(255, 145, 77, 1),
            Color.fromRGBO(255, 222, 89, 1),
            Color.fromRGBO(124, 100, 2, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        )),
        child: Stack(children: [
          ListView(
            children: [
              CustomAiChatRow(),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: size.height * 0.83,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 14).withOpacity(0.84),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: GetBuilder<ImpAiChatControoler>(
                  builder: ((controller) => Column(
                        children: [
                          CustomAiMessage(),
                          Expanded(child: Container()),
                          CustomAiChatTextField()
                        ],
                      )),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
//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