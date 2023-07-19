import 'package:face_detector/controller/TextDetectorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextContainer extends GetView<ImpTextDetectorControoler> {
  const CustomTextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: size.height * 0.18,
        width: size.width * 0.85,
        decoration: BoxDecoration(
            gradient: controller.file == null
                ? null
                : LinearGradient(
                    colors: [
                        Color.fromARGB(255, 252, 252, 252),
                        Color.fromARGB(255, 143, 136, 36),
                      ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(3.14 / 4)),
            borderRadius: BorderRadius.circular(20),
            border: controller.file == null ? null : Border.all()),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: SelectableText(
                "${controller.scannedText}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }
}
