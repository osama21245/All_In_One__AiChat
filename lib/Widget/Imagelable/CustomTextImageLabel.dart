import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ImageLabelController.dart';

class CustomTextImageLabel extends GetView<ImpImagelabelControoler> {
  const CustomTextImageLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "${controller.LabelResult}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
