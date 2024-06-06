import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/delete_account_reason_response.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/delete_account_report_page/controller.dart';

class CustomReportRadio extends StatelessWidget {
  final DeleteAccountReasonResponse titles;

  const CustomReportRadio({super.key, required this.titles});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteAccountReportController>(builder: (_) {
      return Column(
        children: titles.data!.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value.reason!;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.65,
                child: Text(
                  option,
                  style: consttext,
                ),
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
