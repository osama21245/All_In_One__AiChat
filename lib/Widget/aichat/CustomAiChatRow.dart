import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAiChatRow extends StatelessWidget {
  const CustomAiChatRow({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 27,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Text("107".tr, style: TextStyle(color: Colors.white, fontSize: 20)),
          Image.asset(
            "assets/CahtGpt-removebg-preview.png",
            width: size.width * 0.12,
            height: size.height * 0.12,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
