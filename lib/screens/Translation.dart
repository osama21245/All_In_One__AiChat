import 'dart:io';

import 'package:face_detector/Widget/CustomMainbody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HandlingDataView.dart';
import '../Widget/translate/CustomInputTextField.dart';
import '../Widget/translate/CustomList.dart';
import '../Widget/translate/CustomTranslateButton.dart';
import '../Widget/translate/CustomTranslationValue.dart';
import '../controller/TranslatorController.dart';

class Translation extends GetView<ImpTranslationController> {
  const Translation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpTranslationController());
    try {} on SocketException catch (_) {
      controller.showsnackbar();
    }
    return Scaffold(
      body: CustomMainbody(
          child: ListView(
        children: [
          GetBuilder<ImpTranslationController>(
              builder: (controller) => Form(
                    key: controller.formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.2,
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(228, 241, 221, 133),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('From'),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  DropdownButton(
                                      value: controller.selectedvalue,
                                      focusColor: Colors.transparent,
                                      items: controller.languages.map((lang) {
                                        return DropdownMenuItem(
                                          value: lang,
                                          child: Text(lang),
                                          onTap: () {
                                            if (lang ==
                                                controller.languages[0]) {
                                              controller.from =
                                                  controller.languagescode[0];
                                            } else if (lang ==
                                                controller.languages[1]) {
                                              controller.from =
                                                  controller.languagescode[1];
                                            } else if (lang ==
                                                controller.languages[2]) {
                                              controller.from =
                                                  controller.languagescode[2];
                                            } else if (lang ==
                                                controller.languages[3]) {
                                              controller.from =
                                                  controller.languagescode[3];
                                            } else if (lang ==
                                                controller.languages[4]) {
                                              controller.from =
                                                  controller.languagescode[4];
                                            } else if (lang ==
                                                controller.languages[5]) {
                                              controller.from =
                                                  controller.languagescode[5];
                                            } else if (lang ==
                                                controller.languages[6]) {
                                              controller.from =
                                                  controller.languagescode[6];
                                            } else if (lang ==
                                                controller.languages[7]) {
                                              controller.from =
                                                  controller.languagescode[7];
                                            } else if (lang ==
                                                controller.languages[8]) {
                                              controller.from =
                                                  controller.languagescode[8];
                                            } else if (lang ==
                                                controller.languages[9]) {
                                              controller.from =
                                                  controller.languagescode[9];
                                            } else if (lang ==
                                                controller.languages[10]) {
                                              controller.from =
                                                  controller.languagescode[10];
                                            } else if (lang ==
                                                controller.languages[11]) {
                                              controller.from =
                                                  controller.languagescode[11];
                                            }
                                            controller.update();
                                          },
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        controller.translate();
                                        controller.selectedvalue = value!;
                                      }),
                                ])),
                        CustomInputTextField(
                          inputValue: controller.controller,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Divider(),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(41, 197, 202, 233),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('To'),
                              const SizedBox(
                                width: 100,
                              ),
                              DropdownButton(
                                value: controller.selectedvalue2,
                                focusColor: Colors.transparent,
                                items: controller.languages.map((lang) {
                                  return DropdownMenuItem(
                                    value: lang,
                                    child: Text(lang),
                                    onTap: () {
                                      if (lang == controller.languages[0]) {
                                        controller.to =
                                            controller.languagescode[0];
                                      } else if (lang ==
                                          controller.languages[1]) {
                                        controller.to =
                                            controller.languagescode[1];
                                      } else if (lang ==
                                          controller.languages[2]) {
                                        controller.to =
                                            controller.languagescode[2];
                                      } else if (lang ==
                                          controller.languages[3]) {
                                        controller.to =
                                            controller.languagescode[3];
                                      } else if (lang ==
                                          controller.languages[4]) {
                                        controller.to =
                                            controller.languagescode[4];
                                      } else if (lang ==
                                          controller.languages[5]) {
                                        controller.to =
                                            controller.languagescode[5];
                                      } else if (lang ==
                                          controller.languages[6]) {
                                        controller.to =
                                            controller.languagescode[6];
                                      } else if (lang ==
                                          controller.languages[7]) {
                                        controller.to =
                                            controller.languagescode[7];
                                      } else if (lang ==
                                          controller.languages[8]) {
                                        controller.to =
                                            controller.languagescode[8];
                                      } else if (lang ==
                                          controller.languages[9]) {
                                        controller.to =
                                            controller.languagescode[9];
                                      } else if (lang ==
                                          controller.languages[10]) {
                                        controller.to =
                                            controller.languagescode[10];
                                      } else if (lang ==
                                          controller.languages[11]) {
                                        controller.to =
                                            controller.languagescode[11];
                                      }
                                      controller.update();
                                    },
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  controller.translate();

                                  controller.selectedvalue2 = value!;
                                },
                              )
                            ],
                          ),
                        ),
                        HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: CustomTranslateValue(
                            TranslateValue: controller.data,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        CustomTranslateButton(),
                      ],
                    ),
                  )),
        ],
      )),
    );
  }
}
