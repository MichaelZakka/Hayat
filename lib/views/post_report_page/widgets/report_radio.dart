import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/post_report_page/controller.dart';

class ReportRadio extends StatelessWidget {
  final List<String> titles;
  
  const ReportRadio({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostReportController>(builder: (_) {
      return Column(
        children: titles.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                option,
                style: consttext,
              ),
              Radio(
                activeColor: blue1,
                value: index,
                groupValue: _.selectedValue.value,
                onChanged: (newvalue) {
                  _.updateSelectedValue(newvalue!);
                },
              ),
            ],
          );
        }).toList(),
      );
    });
  }
}
