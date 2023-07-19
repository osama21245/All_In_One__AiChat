import 'dart:io';

import 'package:face_detector/controller/homeControoler.dart';
import 'package:face_detector/core/class/HomeClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/function/databaseTranslate.dart';

// ignore: must_be_immutable
class CustomHomeCard extends GetView<ImphomePageControoler> {
  HomeClass homelist;
  CustomHomeCard({super.key, required this.homelist});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          if (homelist.id == 6) {
            String? lang = myservices.sharedPreferences.getString("lang");
            lang == "en"
                ? Get.defaultDialog(
                    title: "Warning",
                    middleText:
                        "Are You sure you want to change language to Arabic "
                            .tr,
                    onConfirm: () {
                      myservices.sharedPreferences.setString("lang", "ar");
                      print(lang);
                      exit(0);
                    },
                    onCancel: () {},
                    buttonColor: const Color.fromARGB(104, 255, 193, 7),
                    confirmTextColor: Colors.white,
                    cancelTextColor: const Color.fromARGB(104, 255, 193, 7),
                    textConfirm: "48".tr,
                    textCancel: "49".tr)
                : Get.defaultDialog(
                    title: "تنبيه",
                    middleText: "هل تريد تغيير اللغه الي اللفه الانجليزيه ".tr,
                    onConfirm: () {
                      myservices.sharedPreferences.setString("lang", "en");
                      print(lang);
                      exit(0);
                    },
                    onCancel: () {},
                    buttonColor: const Color.fromARGB(104, 255, 193, 7),
                    confirmTextColor: Colors.white,
                    cancelTextColor: const Color.fromARGB(104, 255, 193, 7),
                    textConfirm: "48".tr,
                    textCancel: "49".tr);
          } else {
            controller.goto(homelist);
          }
        },
        child: Card(
          color: homelist.id == 5
              ? Color.fromARGB(143, 54, 41, 2)
              : Color.fromARGB(0, 223, 171, 16),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    homelist.id == 5
                        ? Image.asset(
                            "assets/CahtGpt-removebg-preview.png",
                            width: size.width * 0.3,
                            color: Color.fromARGB(47, 255, 255, 255),
                          )
                        : homelist.icon,
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      homelist.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "PlayfairDisplay",
                          fontSize: 15,
                          color: homelist.id == 5
                              ? Color.fromARGB(47, 255, 255, 255)
                              : null),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: homelist.id == 5
                              ? Color.fromARGB(47, 255, 255, 255)
                              : Color.fromARGB(255, 41, 41, 41),
                        ),
                        Text(homelist.subtitle,
                            style: TextStyle(
                                color: homelist.id == 5
                                    ? Color.fromARGB(47, 255, 255, 255)
                                    : Color.fromARGB(255, 41, 41, 41),
                                fontSize: 6,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              if (homelist.id == 5)
                Icon(
                  Icons.key,
                  size: 45,
                  color: Colors.amber,
                )
            ],
          ),
        ),
      ),
    );
  }
}
