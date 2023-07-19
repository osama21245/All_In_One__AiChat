import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomMainbody extends StatelessWidget {
  Widget child;
  CustomMainbody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/2535269.png",
                ))),
        child: child);
  }
}
