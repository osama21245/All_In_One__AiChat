import 'package:face_detector/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

abstract class QRCodeController extends GetxController {
  StatusRequest? statusRequest;

  String codeResult = "130".tr;
}

class ImpQRCodeController extends QRCodeController {
  QRCodeShow(context) async {
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(
            isShowFlashIcon: true,
          ),
        ));
    if (res is String) {
      codeResult = res;
      update();
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    super.onInit();
  }
}
