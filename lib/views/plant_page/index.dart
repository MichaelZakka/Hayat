import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/plant_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/plant_page/widgets/plant_detail.dart';
import 'package:hayat/views/plant_page/widgets/plant_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class PlantPage extends StatelessWidget {
  final PlantResponse? plant;
  final String? color;
  const PlantPage({super.key, this.color, this.plant});

  @override
  Widget build(BuildContext context) {
    String? background;
    if (color == 'Purple Blue') {
      background = PURPLE_BACKGROUND1;
    } else if (color == 'Yellow Orange') {
      background = YELLOW_BACKGROUND1;
    } else if (color == 'Red Pink') {
      background = PINK_BACKGROUND1;
    } else if (color == 'Green') {
      background = GREEN_BACKGROUND1;
    } else if (color == 'White Cream') {
      background = WHITE_BACKGROUND1;
    } else if (color == 'Brown') {
      background = ORANGE_BACKGROUND1;
    }

    // if()

    Color themecolor() {
      if (color == 'Purple Blue') {
        background = PURPLE_BACKGROUND1;
        return purple;
      } else if (color == 'Yellow Orange') {
        background = YELLOW_BACKGROUND1;
        return yellow1;
      } else if (color == 'Red Pink') {
        background = PINK_BACKGROUND1;

        return pink;
      } else if (color == 'Green') {
        background = GREEN_BACKGROUND1;

        return green1;
      } else if (color == 'White Cream') {
        background = WHITE_BACKGROUND1;

        return creamy;
      } else if (color == 'Brown') {
        background = ORANGE_BACKGROUND1;

        return brown;
      }
      return cayn1;
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height * 3.12,
              child: SvgPicture.asset(
                background!,
                fit: BoxFit.cover,
                width: Get.width,

              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      title: '${plant!.name}',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantWidget(
                      asset: plant!.images,
                      isPicture: true,
                      width: 300.r,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Container(
                      alignment: Alignment.center,
                      width: Get.width * 0.5,
                      child: Text(
                        '${plant!.name}',
                        style: largetext,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.035),
                    PlantWidget(
                      color: themecolor(),
                      plant: plant,
                      width: 300.r,
                      isPicture: false,
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.synonym}',
                      title: 'Synonym',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.subspecies}',
                      title: 'Subspecies',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.commonName}',
                      title: 'Common Name',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.native}',
                      title: 'Native/Non Native',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.habitat}',
                      title: 'Habitat',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.duration}',
                      title: 'Duration',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.abundance}',
                      title: 'Abundance',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.stemHabit}',
                      title: 'Stem Habit',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.corollaColor![0].title}',
                      title: 'Corolla Color',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.plantLength}',
                      title: 'Plant Length',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.environment}',
                      title: 'Environment',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.leafShape}',
                      title: 'Leaf Shape',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.generalDistribution}',
                      title: 'General Distribution',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.localDistribution}',
                      title: 'Local Distribution',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.uses}',
                      title: 'Uses',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.references}',
                      title: 'References',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    PlantDetail(
                      color: themecolor(),
                      info: '${plant!.description}',
                      title: 'Description',
                    ),
                    SizedBox(height: Get.height * 0.025),
                    // PlantDetail(
                    //   info:
                    //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s',
                    //   title: 'title',
                    // ),
                    // SizedBox(height: Get.height * 0.025),
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
