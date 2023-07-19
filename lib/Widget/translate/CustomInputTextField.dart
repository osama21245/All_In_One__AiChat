import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/TranslatorController.dart';

// ignore: must_be_immutable
class CustomInputTextField extends GetView<ImpTranslationController> {
  late TextEditingController inputValue;

  CustomInputTextField({super.key, required this.inputValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color.fromARGB(209, 241, 221, 133),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(179, 0, 0, 0))),
      child: TextFormField(
        controller: inputValue,
        maxLines: null,
        minLines: null,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            errorStyle: TextStyle(color: Color.fromARGB(255, 185, 4, 4))),
        style: const TextStyle(
            color: Color.fromARGB(255, 22, 22, 22),
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
    );
  }
}
