import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

// ignore: must_be_immutable
class CustomMyCheckouutText extends StatelessWidget {
  String textname;
  CustomMyCheckouutText({super.key, required this.textname});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13.0,
      ),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientText(
              'All In One',
              style: TextStyle(
                fontSize: 34.0,
              ),
              colors: [
                const Color.fromARGB(185, 0, 0, 0),
                Color.fromARGB(76, 0, 0, 0)
              ],
            ),
            Image.asset(
              "assets/AppIcon.png",
              color: const Color.fromARGB(106, 0, 0, 0),
              width: size.width * 0.1,
            )
          ],
        ),
      ),
    );
  }
}
