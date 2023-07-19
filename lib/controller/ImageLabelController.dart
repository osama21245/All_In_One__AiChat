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

class ImagelabelControoler extends GetxController {
  late StatusRequest statusRequest;
  bool ScanOperation = false;
  String LabelResult = "";
  File? file;
}

class ImpImagelabelControoler extends ImagelabelControoler {
  chooseImageGallery() async {
    statusRequest = StatusRequest.loading;
    ScanOperation = true;
    update();
    file = await fileuploadGallery();
    await getImagelabel(file!);

    print(file);
    ScanOperation = false;
    statusRequest = StatusRequest.success;
    update();
  }

//await getImagelabel(file!);
  chooseImageCamera() async {
    statusRequest = StatusRequest.loading;
    ScanOperation = true;

    update();

    file = await imageuploadCamera();
    await getImagelabel(file!);

    print(file);
    statusRequest = StatusRequest.success;
    ScanOperation = false;
    update();
  }

  chooseImage(Size size) {
    ShowBottomMenu(() => chooseImageCamera(), () => chooseImageGallery(), size);
    update();
  }

  getImagelabel(File image) async {
    final inputimage = InputImage.fromFilePath(image.path);
    print("1");
    ImageLabeler imageLabeler = ImageLabeler(options: ImageLabelerOptions());
    print("2");
    List<ImageLabel> labels = await imageLabeler.processImage(inputimage);
    print("3");
    StringBuffer sb = StringBuffer();

    for (ImageLabel imglabel in labels) {
      String lblText = imglabel.label;
      double confidence = imglabel.confidence;
      sb.write(lblText);
      sb.write(" : ");
      sb.write((confidence * 100).toStringAsFixed(2));
      sb.write("%");
    }
    imageLabeler.close();
    LabelResult = sb.toString();

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
