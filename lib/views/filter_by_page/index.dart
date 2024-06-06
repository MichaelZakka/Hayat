import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/views/filter_by_page/controller.dart';
import 'package:hayat/views/filter_by_page/widgets/custom_radio.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class FilterByPage extends StatefulWidget {
  const FilterByPage({super.key});

  @override
  State<FilterByPage> createState() => _FilterByPageState();
}

class _FilterByPageState extends State<FilterByPage> {
  String? selectedRadioValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                  child: SvgPicture.asset(
                width: Get.width,
                BLUE_BACKGROUND4,
                fit: BoxFit.cover,
              )),
              const CustomAppBar(
                title: 'Filter By',
                SvgAsset: X_ICON,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  height: Get.height * 0.07,
                  width: Get.width * 0.23,
                  child: GetBuilder<FilterByController>(builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        _.resetValues();
                      },
                      child: const Center(
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.15,
                  ),
                  Center(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<FilterByController>(builder: (_) {
                            return CustomRadio(
                              choice: _.selectedValue1.value,
                              title: 'Duration',
                              choices: _.duration,
                            );
                          }),
                          SizedBox(
                            height: Get.height * 0.024,
                          ),
                          GetBuilder<FilterByController>(builder: (_) {
                            return CustomRadio(
                              choice: _.selectedValue2.value,
                              title: 'Cotyledon',
                              choices: _.cotyledon,
                            );
                          }),
                          SizedBox(
                            height: Get.height * 0.024,
                          ),
                          GetBuilder<FilterByController>(builder: (_) {
                            return CustomRadio(
                              choice: _.selectedValue3.value,
                              title: 'Native/Non Native',
                              choices: _.native,
                            );
                          }),
                          SizedBox(
                            height: Get.height * 0.024,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
