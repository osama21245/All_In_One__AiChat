import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
ExitApp() {
  Get.defaultDialog(
      title: "Warning".tr,
      middleText: "Are you sure you want to leave app",
      onConfirm: () {
        exit(0);
      },
      onCancel: () {},
      buttonColor: Colors.grey,
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.grey,
      textConfirm: "yes",
      textCancel: "no");
  return Future.value(false);
}
