import 'package:face_detector/Widget/CustomMainbody.dart';
import 'package:face_detector/controller/TextDetectorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HandlingDataView.dart';
import '../Widget/Imagelable/CustomCamerIcon.dart';
import '../Widget/Imagelable/CustomTextImageLabel.dart';
import '../Widget/TextDetection/CustomCamerIcon.dart';

import '../controller/ImageLabelController.dart';

class ImageLabel extends StatelessWidget {
  const ImageLabel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpImagelabelControoler());
    Get.put(ImpTextDetectorControoler());
    return Scaffold(
        body: CustomMainbody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<ImpImagelabelControoler>(
              builder: (contollerlab) => HandlingDataView(
                  statusRequest: contollerlab.statusRequest,
                  widget: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      contollerlab.file == null
                          ? CustomCameraIconLabel()
                          : InkWell(
                              onTap: () {
                                contollerlab.chooseImage(size);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: Image.file(contollerlab.file!,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.4,
                                    width: size.width * 0.8),
                              ),
                            ),
                      contollerlab.ScanOperation == true
                          ? CircularProgressIndicator()
                          : CustomTextImageLabel()
                    ],
                  ))),
        ],
      ),
    ));
  }
}
