import 'package:camera/camera.dart';
import 'package:face_detector/core/class/HomeClass.dart';
import 'package:face_detector/core/class/statusrequest.dart';
import 'package:face_detector/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../core/constant/routesname.dart';
import '../core/function/databaseTranslate.dart';

abstract class homePageControoler extends GetxController {
  late StatusRequest statusRequest;
  String resultlabel = "";
  late ImagePicker imagepicker;
  bool isWorking = false;
  CameraController? cameraConroller;
  CameraImage? imgCamera;
}

class ImphomePageControoler extends homePageControoler {
  goto(HomeClass homelist) {
    if (homelist.id == 1) {
      Get.toNamed(AppRoutes.textdetector);
    } else if (homelist.id == 3) {
      Get.toNamed(AppRoutes.imagelabel);
    } else if (homelist.id == 4) {
      Get.toNamed(AppRoutes.Translation);
    } else if (homelist.id == 2) {
      Get.toNamed(AppRoutes.QRcode);
    } else if (homelist.id == 5) {
      Get.toNamed(AppRoutes.AiChat);
    }
  }

  List<HomeClass> homelist = [
    HomeClass(
        id: 1,
        title: "103".tr,
        subtitle: "109".tr,
        icon: Icon(
          Icons.text_fields,
          size: 60,
        )),
    HomeClass(
        id: 2,
        title: "104".tr,
        subtitle: "110".tr,
        icon: Icon(
          Icons.qr_code_scanner_outlined,
          size: 60,
        )),
    HomeClass(
      id: 3,
      title: "105".tr,
      subtitle: "111".tr,
      icon: Icon(
        Icons.scatter_plot,
        size: 60,
      ),
    ),
    HomeClass(
        id: 4,
        title: "106".tr,
        subtitle: "112".tr,
        icon: Icon(
          Icons.translate,
          size: 60,
        )),
    HomeClass(
        id: 5,
        title: "107".tr,
        subtitle: "113".tr,
        icon: Icon(
          Icons.ac_unit,
          size: 60,
        )),
    HomeClass(
        id: 6,
        title: "108".tr,
        subtitle: "114".tr,
        icon: Icon(
          Icons.language,
          size: 60,
        ))
  ];

  initcamera() {
    cameraConroller = CameraController(cameras![0], ResolutionPreset.medium);
    cameraConroller!.initialize().then((value) {
      cameraConroller!.startImageStream((imageFrameStream) => {
            if (!isWorking)
              {
                isWorking = true,
                imgCamera = imageFrameStream,
              }
          });
    });
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    imagepicker = ImagePicker();
    super.onInit();
  }

  @override
  void dispose() async {
    super.dispose();
    cameraConroller?.dispose();
  }
}
