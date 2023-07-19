import 'package:face_detector/Widget/CustomMainbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HandlingDataView.dart';
import '../Widget/TextDetection/CustomCamerIcon.dart';
import '../Widget/TextDetection/CustomTextContainer.dart';
import '../controller/TextDetectorController.dart';

class TextDetector extends StatelessWidget {
  const TextDetector({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpTextDetectorControoler());
    return Scaffold(
        body: CustomMainbody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<ImpTextDetectorControoler>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      controller.file == null
                          ? CustomCameraIcon()
                          : InkWell(
                              onTap: () {
                                controller.chooseImage(size);
                              },
                              child: Container(
                                width: size.width * 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.file(controller.file!),
                                ),
                              ),
                            ),
                      controller.ScanOperation == true
                          ? CircularProgressIndicator()
                          : CustomTextContainer()
                    ],
                  ))),
        ],
      ),
    ));
  }
}
