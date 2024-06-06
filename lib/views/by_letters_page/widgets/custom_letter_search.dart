import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/plant_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/by_letters_page/controller.dart';
import 'package:hayat/views/plant_page/index.dart';

class CustomLetterSearch extends StatelessWidget {
  const CustomLetterSearch({super.key, this.plants});
  final List<PlantResponse>? plants;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ByLettersController>(builder: (_) {
      return Container(
        width: Get.width * 0.86,
        color: const Color.fromRGBO(188, 213, 216, 0.76),
        child: Center(
          child: SizedBox(
            width: Get.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.725,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.017,
                      ),
                      SizedBox(
                        height: Get.height * 0.7,
                        child: ListView.builder(
                            controller: _.scrollController,
                            itemCount: plants!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  CustomRow(
                                    plant: plants![index],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: 2,
                    child: Text(
                      'ABCDEFGHIJKLMNOPQRSTUVWXYZ#',
                      style: smalltext1,
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CustomRow extends StatelessWidget {
  CustomRow({super.key, required this.plant});
  final PlantResponse plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PlantPage(
          color: plant.corollaColor![0].title,
          // color: ,
          plant: plant,
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${plant.name}',
            style: consttext,
          ),
          SvgPicture.asset(ARROW_ICON)
        ],
      ),
    );
  }
}
