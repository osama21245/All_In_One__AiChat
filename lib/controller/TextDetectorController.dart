import 'dart:io';

import 'package:camera/camera.dart';
import 'package:face_detector/core/class/HomeClass.dart';
import 'package:face_detector/core/class/statusrequest.dart';
import 'package:face_detector/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../core/constant/routesname.dart';
import '../core/function/uploadfile.dart';

abstract class TextDetectorControoler extends GetxController {
  late StatusRequest statusRequest;
  bool ScanOperation = false;
  String scannedText = "";
  File? file;
}

class ImpTextDetectorControoler extends TextDetectorControoler {
  chooseImageGallery() async {
    statusRequest = StatusRequest.loading;
    ScanOperation = true;
    update();
    file = await fileuploadGallery();
    getRecognisedText(file!);
    print(file);
    statusRequest = StatusRequest.success;
    update();
  }

  chooseImageCamera() async {
    statusRequest = StatusRequest.loading;
    ScanOperation = true;

    update();

    file = await imageuploadCamera();
    getRecognisedText(file!);

    ScanOperation = true;
    print(file);
    statusRequest = StatusRequest.success;
    update();
  }

  chooseImage(Size size) {
    ShowBottomMenu(() => chooseImageCamera(), () => chooseImageGallery(), size);
    update();
  }

  void getRecognisedText(File image) async {
    final inputimage = InputImage.fromFilePath(image.path);
    final TextDetector1 = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText =
        await TextDetector1.processImage(inputimage);
    await TextDetector1.close();
    scannedText = "";
    // ignore: unused_local_variable
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    ScanOperation = false;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;

    super.onInit();
  }

  @override
  void dispose() async {
    super.dispose();
  }
}
