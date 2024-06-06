import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/plant_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/by_letters_page/controller.dart';
import 'package:hayat/views/by_letters_page/widgets/custom_letter_search.dart';
import 'package:hayat/views/filter_by_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class ByLettersPage extends StatelessWidget {
  ByLettersPage({super.key});
  final FilterByController filterByController = Get.put(FilterByController());
  final ByLettersController byLettersController =
      Get.put(ByLettersController());

  @override
  Widget build(BuildContext context) {
    getPlants() {
      List<PlantResponse>? plants =
          byLettersController.plantsByLetter.data!.toList();
      if (filterByController.selectedValue1.value != 0) {
        plants = byLettersController.plantsByLetter.data!
            .where((plant) =>
                plant.duration ==
                filterByController
                    .duration[filterByController.selectedValue1.value]
                    .toLowerCase())
            .toList();
      }
      if (filterByController.selectedValue2.value != 0) {
        plants = byLettersController.plantsByLetter.data!
            .where((plant) =>
                plant.cotyledon ==
                filterByController
                    .cotyledon[filterByController.selectedValue2.value]
                    .toLowerCase())
            .toList();
      }
      if (filterByController.selectedValue3.value != 0) {
        plants = byLettersController.plantsByLetter.data!
            .where((plant) =>
                plant.native ==
                filterByController
                    .native[filterByController.selectedValue3.value]
                    .toLowerCase())
            .toList();
      }
      return plants;
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: Get.height * 1.25,
              child: SvgPicture.asset(
                BLUE_BACKGROUND2,
                fit: BoxFit.cover,
                width: Get.width,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(title: 'By Letter'),
                    SizedBox(
                        width: Get.width * 0.86,
                        child: byLettersController.isDataReady.value
                            ? GetBuilder<FilterByController>(builder: (_) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.025,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${getPlants().length} PLANTS',
                                          style: largetext,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Get.toNamed('/filterbyPage');
                                            },
                                            child: SvgPicture.asset(FILTER_ICON)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.025,
                                    ),
                                    CustomLetterSearch(
                                      plants: getPlants(),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.025,
                                    )
                                  ],
                                );
                              })
                            : Center(
                                child: CircularProgressIndicator(
                                  color: blue1,
                                ),
                              )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
