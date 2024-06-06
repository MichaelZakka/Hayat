import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/plant_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/color_page/controller.dart';
import 'package:hayat/views/color_page/widgets/no_result_found.dart';
import 'package:hayat/views/filter_by_page/controller.dart';
import 'package:hayat/views/plant_page/index.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class ColorPage extends StatelessWidget {
  final String? color;
  final int? id;
  ColorPage({this.color, this.id, super.key});
  final ColorController colorController = Get.put(ColorController());
  final FilterByController filterByController = Get.put(FilterByController());

  @override
  Widget build(BuildContext context) {
    Color contentColor = cayn1;
    List<PlantResponse>? getPlants() {
      List<PlantResponse>? plants;
      if (id != 7) {
        plants = colorController.plants.data!
            .where((plant) => plant.corollaColor![0].id == id)
            .toList();
        if (filterByController.selectedValue1.value != 0) {
          plants = colorController.plants.data!
              .where((plant) => plant.corollaColor![0].id == id)
              .where((plant) =>
                  plant.duration ==
                  filterByController
                      .duration[filterByController.selectedValue1.value]
                      .toLowerCase())
              .toList();
        }
        if (filterByController.selectedValue2.value != 0) {
          plants = colorController.plants.data!
              .where((plant) => plant.corollaColor![0].id == id)
              .where((plant) =>
                  plant.duration ==
                  filterByController
                      .duration[filterByController.selectedValue1.value]
                      .toLowerCase())
              .where((plant) =>
                  plant.cotyledon ==
                  filterByController
                      .cotyledon[filterByController.selectedValue2.value])
              .toList();
        }
        if (filterByController.selectedValue3.value != 0) {
          plants = colorController.plants.data!
              .where((plant) => plant.corollaColor![0].id == id)
              .where((plant) =>
                  plant.duration ==
                  filterByController
                      .duration[filterByController.selectedValue1.value]
                      .toLowerCase())
              .where((plant) =>
                  plant.cotyledon ==
                  filterByController
                      .cotyledon[filterByController.selectedValue2.value])
              .where((plant) =>
                  plant.native ==
                  filterByController
                      .native[filterByController.selectedValue3.value])
              .toList();
        }
        return plants;
      } else if (id == 7) {
        plants = colorController.plants.data!.toList();
        if (filterByController.selectedValue1.value != 0) {
          plants = colorController.plants.data!
              .where((plant) =>
                  plant.duration ==
                  filterByController
                      .duration[filterByController.selectedValue1.value]
                      .toLowerCase())
              .toList();
        }
        if (filterByController.selectedValue2.value != 0) {
          plants = colorController.plants.data!
              .where((plant) =>
                  plant.duration ==
                  filterByController
                      .duration[filterByController.selectedValue1.value]
                      .toLowerCase())
              .where((plant) =>
                  plant.cotyledon ==
                  filterByController
                      .cotyledon[filterByController.selectedValue2.value])
              .toList();
        }
        if (filterByController.selectedValue3.value != 0) {
          plants = colorController.plants.data!
              .where((plant) =>
                  plant.duration ==
                  filterByController
                      .duration[filterByController.selectedValue1.value]
                      .toLowerCase())
              .where((plant) =>
                  plant.cotyledon ==
                  filterByController
                      .cotyledon[filterByController.selectedValue2.value]
                      .toLowerCase())
              .where((plant) =>
                  plant.native ==
                  filterByController
                      .native[filterByController.selectedValue3.value]
                      .toLowerCase())
              .toList();
        }
        return plants;
      }
      return plants;
    }

    String background() {
      if (color == 'PURPLE/BLUE') {
        contentColor = purple;
        return PURPLE_BACKGROUND1;
      } else if (color == 'YELLOW/ORANGE') {
        contentColor = yellow1;
        return YELLOW_BACKGROUND1;
      } else if (color == 'RED/PINK') {
        contentColor = pink;
        return PINK_BACKGROUND1;
      } else if (color == 'GREEN') {
        contentColor = green1;
        return GREEN_BACKGROUND1;
      } else if (color == 'WHITE/CREAMY') {
        contentColor = creamy;
        return WHITE_BACKGROUND1;
      } else if (color == 'BROWN') {
        contentColor = brown;
        return ORANGE_BACKGROUND1;
      }
      return BLUE_BACKGROUND4;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: GetBuilder<ColorController>(builder: (_) {
          return Stack(
            children: [
              SizedBox(
                height: Get.height,
                child: SvgPicture.asset(
                  background(),
                  fit: BoxFit.cover,
                  width: Get.width,
                ),
              ),
              Center(
                child: GetBuilder<FilterByController>(builder: (context) {
                  return SizedBox(
                      width: Get.width,
                      child: Column(
                        children: [
                          CustomAppBar(title: color ?? 'ALL COLORS'),
                          _.isDataReady.value
                              ? getPlants()!.isEmpty
                                  ? Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: Get.height * 0.2,
                                          ),
                                          NoResultFound(
                                            color: contentColor,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: Get.width * 0.86,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: Get.height * 0.025,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${getPlants()!.length} PLANTS',
                                                  style: largetext,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/filterbyPage');
                                                  },
                                                  child: SvgPicture.asset(
                                                    FILTER_ICON,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.024,
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.78,
                                              child: GridView.builder(
                                                  controller:
                                                      _.scrollController,
                                                  itemCount:
                                                      getPlants()!.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          childAspectRatio:
                                                              0.8),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return CircleButton(
                                                        icon:
                                                            getPlants()![index]
                                                                .mainImage!,
                                                        width: 125.r,
                                                        onTap: () {
                                                          Get.to(
                                                              () => PlantPage(
                                                                    color: getPlants()![
                                                                            index]
                                                                        .corollaColor![
                                                                            0]
                                                                        .title,
                                                                    plant: getPlants()![
                                                                        index],
                                                                  ));
                                                        },
                                                        text1:
                                                            getPlants()![index]
                                                                .name);
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: contentColor,
                                  ),
                                )
                        ],
                      ));
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
