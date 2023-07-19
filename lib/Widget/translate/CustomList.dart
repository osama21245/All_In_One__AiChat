import 'package:face_detector/controller/TranslatorController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomList extends GetView<ImpTranslationController> {
  String Slelectvalue;
  String listType;
  CustomList({super.key, required this.listType, required this.Slelectvalue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
          color: Colors.indigo.shade100,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('From'),
          const SizedBox(
            width: 100,
          ),
          DropdownButton(
            value: Slelectvalue,
            focusColor: Colors.transparent,
            items: controller.languages.map((lang) {
              return DropdownMenuItem(
                value: lang,
                child: Text(lang),
                onTap: () {
                  if (lang == controller.languages[0]) {
                    listType = controller.languagescode[0];
                  } else if (lang == controller.languages[1]) {
                    listType = controller.languagescode[1];
                  } else if (lang == controller.languages[2]) {
                    listType = controller.languagescode[2];
                  } else if (lang == controller.languages[3]) {
                    listType = controller.languagescode[3];
                  } else if (lang == controller.languages[4]) {
                    listType = controller.languagescode[4];
                  } else if (lang == controller.languages[5]) {
                    listType = controller.languagescode[5];
                  } else if (lang == controller.languages[6]) {
                    listType = controller.languagescode[6];
                  } else if (lang == controller.languages[7]) {
                    listType = controller.languagescode[7];
                  } else if (lang == controller.languages[8]) {
                    listType = controller.languagescode[8];
                    Slelectvalue = controller.languages[8];
                  }
                },
              );
            }).toList(),
            onChanged: (value) {
              controller.update();
            },
          )
        ],
      ),
    );
  }
}
