import 'package:face_detector/controller/ImageLabelController.dart';
import 'package:face_detector/controller/TextDetectorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomCameraIconLabel extends GetView<ImpImagelabelControoler> {
  const CustomCameraIconLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        controller.chooseImage(size);
      },
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), border: Border.all()),
        child: Icon(
          Icons.camera_alt_outlined,
          size: 50,
        ),
      ),
    );
  }
}
