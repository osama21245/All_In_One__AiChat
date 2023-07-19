import 'package:face_detector/controller/AiChatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAiChatTextField extends GetView<ImpAiChatControoler> {
  const CustomAiChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextFormField(
        controller: controller.messageuser,
        decoration: InputDecoration(
            hintText: "131".tr,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: Color.fromARGB(88, 223, 178, 136),
            contentPadding: EdgeInsets.all(20),
            suffixIcon: controller.isloading == false
                ? IconButton(
                    onPressed: () {
                      controller.messages.add({
                        "sender": "user",
                        "message": controller.messageuser!.text
                      });
                      controller.update();
                      controller.sendMessage(controller.messageuser!.text);
                      controller.scrolldown();
                      controller.messageuser!.clear();
                    },
                    icon: Icon(Icons.send),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}
