import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/filter_by_page/controller.dart';

class CustomRadio extends StatelessWidget {
  final List<String> choices;
  final String? title;
  final int? choice;

  const CustomRadio(
      {required this.choices, super.key, this.choice, this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterByController>(builder: (_) {
      return Container(
        width: Get.width * 0.86,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(188, 213, 216, 0.76),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: SizedBox(
            width: Get.width * 0.72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.032,
                ),
                Text(
                  title ?? "",
                  style: materialfont,
                ),
                SizedBox(
                  height: Get.height * 0.015,
                ),
                Column(
                  children: choices.asMap().entries.map((entry) {
                    int index = entry.key;
                    String option = entry.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: materialfont,
                        ),
                        Radio(
                          activeColor: blue1,
                          value: index,
                          groupValue: choice,
                          onChanged: (newvalue) {
                            if (title == 'Duration') {
                              _.updateSelectedValue1(newvalue!);
                            } else if (title == 'Cotyledon') {
                              _.updateSelectedValue2(newvalue!);
                            } else if (title == 'Native/Non Native') {
                              _.updateSelectedValue3(newvalue!);
                            }
                          },
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
