import 'package:face_detector/controller/AiChatController.dart';
import 'package:face_detector/core/function/databaseTranslate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAiMessage extends GetView<ImpAiChatControoler> {
  const CustomAiMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.only(top: 55.0, left: 25, right: 25, bottom: 30),
      child: Container(
        height: size.height * 0.54,
        width: size.width * 0.85,
        child: ListView.builder(
            controller: controller.scroll,
            shrinkWrap: true,
            reverse: false,
            itemCount: controller.messages.length,
            itemBuilder: (context, index) => myservices.sharedPreferences
                        .getString("lang") ==
                    "en"
                ? Align(
                    alignment: controller.messages[index]["sender"] == "user"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      constraints: BoxConstraints(maxWidth: size.width * 0.66),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.messages[index]["sender"] == "user"
                            ? const Color.fromARGB(190, 255, 193, 7)
                            : Color.fromARGB(197, 134, 67, 3),
                      ),
                      child: Text(
                        controller.messages[index]["message"],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                : Align(
                    alignment: controller.messages[index]["sender"] == "user"
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      constraints: BoxConstraints(maxWidth: size.width * 0.66),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: controller.messages[index]["sender"] == "user"
                            ? const Color.fromARGB(190, 255, 193, 7)
                            : Color.fromARGB(197, 134, 67, 3),
                      ),
                      child: Text(
                        controller.messages[index]["message"],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )),
      ),
    );
  }
}
