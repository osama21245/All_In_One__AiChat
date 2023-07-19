import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HandlingDataView.dart';
import '../Widget/home/CustomHomeCard.dart';
import '../Widget/home/customMyCheckoutText.dart';
import '../controller/homeControoler.dart';
import '../core/function/Exit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImphomePageControoler());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: WillPopScope(
            onWillPop: () {
              return ExitApp();
            },
            child: GetBuilder<ImphomePageControoler>(
                builder: (controller) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/2535269.png",
                            ))),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 29.0),
                          child: CustomMyCheckouutText(
                            textname: "Easy Way".tr,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.032,
                        ),
                        GetBuilder<ImphomePageControoler>(
                            builder: (controller) => HandlingDataView(
                                statusRequest: controller.statusRequest,
                                widget: Column(
                                  children: [
                                    GridView.builder(
                                        itemCount: controller.homelist.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: 0.80,
                                                crossAxisCount: 2),
                                        itemBuilder: (BuildContext context, i) {
                                          ;
                                          return CustomHomeCard(
                                            homelist: controller.homelist[i],
                                          );
                                        }),
                                  ],
                                )))
                      ],
                    )))));
  }
}
