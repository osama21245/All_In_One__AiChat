import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/TranslatorController.dart';

class CustomTranslateButton extends GetView<ImpTranslationController> {
  const CustomTranslateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
          onPressed: () {
            controller.translate();
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(0, 255, 240, 240)),
              fixedSize: const MaterialStatePropertyAll(Size(140, 30))),
          child: controller.isloading
              ? const SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(157, 245, 231, 108),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Translate',
                      style: TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Icon(
                      Icons.translate,
                      size: 17,
                      color: Color.fromARGB(113, 51, 48, 17),
                    )
                  ],
                )),
    );
  }
}
