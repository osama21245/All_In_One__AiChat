import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:face_detector/core/constant/color.dart';
import 'package:face_detector/core/function/databaseTranslate.dart';

imageuploadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path!);
  } else {
    Get.snackbar("Erorr", "There is problem in Your internet");

    return null;
  }
}

fileuploadGallery() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 90);
  if (file != null) {
    return File(file.path!);
  } else {
    Get.snackbar("Erorr", "There is problem in Your internet");
    return null;
  }
}
// fileuploadGallery([isSvg = false]) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions:
//           isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);
//   if (result != null) {
//     return File(result.files.single.path!);
//   } else {
//     return null;
//   }
// }

ShowBottomMenu(imageuploadCamera(), fileuploadGallery(), Size size) {
  return Get.bottomSheet(
    Directionality(
        textDirection: myservices.sharedPreferences.getString("lang") == "en"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.all(10),
          height: size.height * 0.3,
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Choose the image",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              ListTile(
                onTap: () async {
                  await imageuploadCamera();
                  Get.back();
                },
                title: Text(
                  "Choose Photo From Camera",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              ListTile(
                onTap: () async {
                  await fileuploadGallery();
                  Get.back();
                },
                title: Text(
                  "Choose Photo From Gallery",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.image,
                  size: 40,
                  color: Colors.white,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 202, 40),
                  Color.fromARGB(255, 45, 61, 68),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(3.14 / 4)),
          ),
        )),
  );
}
