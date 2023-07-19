import 'package:flutter/material.dart';
import 'package:face_detector/core/class/statusrequest.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:face_detector/core/constant/imgaeasset.dart';

// ignore: must_be_immutable
class HandlingDataView extends StatelessWidget {
  StatusRequest? statusRequest;
  Widget widget;
  HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: LottieBuilder.asset(
              AppImageAsset.loading,
              width: Get.width / 4,
              repeat: true,
            ),
          )
        : statusRequest == StatusRequest.offlinefaliure
            ? Padding(
                padding: const EdgeInsets.all(80),
                child: LottieBuilder.asset(AppImageAsset.offline),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: LottieBuilder.asset(AppImageAsset.server),
                  )
                : statusRequest == StatusRequest.failure
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 200, right: 120, left: 120, bottom: 80),
                        child: LottieBuilder.asset(
                          AppImageAsset.nodata,
                        ),
                      )
                    : widget;
  }
}
