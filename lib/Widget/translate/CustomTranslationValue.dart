import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTranslateValue extends StatelessWidget {
  String TranslateValue;
  CustomTranslateValue({Key? key, required this.TranslateValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0))),
      child: Center(
        child: SelectableText(
          TranslateValue,
          style: const TextStyle(
              color: Color.fromARGB(255, 2, 2, 2),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
