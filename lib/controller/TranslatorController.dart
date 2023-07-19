import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../core/class/statusrequest.dart';

abstract class TranslationController extends GetxController {
  List<String> languages = [
    'English',
    'Hindi',
    'Arabic	',
    'German',
    'Russian',
    'Spanish',
    'Urdu',
    'Japanese	',
    'Italian',
    'French',
    'Turkish',
    'Indonesian'
  ];
  List<String> languagescode = [
    'en',
    'hi',
    'ar',
    'de',
    'ru',
    'es',
    'ur',
    'ja',
    'it',
    'fr',
    'tr',
    'id'
  ];
  final translator = GoogleTranslator();
  String from = 'en';
  String to = 'hi';
  String data = 'आप कैसे हैं?';
  String selectedvalue = 'English';
  String selectedvalue2 = 'Hindi';
  bool isloading = false;
  late TextEditingController controller;
  final formkey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.success;
}

class ImpTranslationController extends TranslationController {
  translate() async {
    statusRequest = StatusRequest.loading;
    isloading = true;

    update();
    if (formkey.currentState!.validate()) {
      await translator
          .translate(controller.text, from: from, to: to)
          .then((value) {
        data = value.text;
        isloading = false;
        statusRequest = StatusRequest.success;
        update();
        if (data != value.text) {
          Get.snackbar("Warning", "plese check internet");
        }
      });
    } else {
      Get.snackbar("46".tr, "115".tr);
    }
  }

  showsnackbar() {
    isloading = true;
    Get.snackbar("Warning", "Check Your Internet");
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void onInit() {
    data = 'आप कैसे हैं?';
    controller = TextEditingController(text: '116'.tr);

//translate();
    super.onInit();
  }
}
