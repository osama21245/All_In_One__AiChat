import 'package:face_detector/Widget/CustomMainbody.dart';
import 'package:face_detector/controller/QRcodeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HandlingDataView.dart';

class QRcode extends StatelessWidget {
  const QRcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ImpQRCodeController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomMainbody(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<ImpQRCodeController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.QRCodeShow(context);
                      },
                      child: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all()),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text("${controller.codeResult}")
                  ],
                ))),
      ],
    )));
  }
}
