import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/trips_page/controller.dart';
import 'package:hayat/views/trips_page/widgets/trip_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class TripsPage extends StatelessWidget {
  TripsPage({super.key});
  final InitController initController = Get.put(InitController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              width: Get.width,
              BLUE_BACKGROUND3,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                            title: '${initController.pages.data![1].title}'),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        CircleButton(
                          icon: TRIPS_ICON,
                          width: 150.r,
                          onTap: () {},
                        ),
                        AuthButton(
                          containercolor: yellow,
                          textcolor: black,
                          text: '${initController.pages.data![1].title}',
                          width: 210.r,
                        ),
                        SizedBox(
                          height: Get.height * 0.037,
                        ),
                        SizedBox(
                          width: Get.width * 0.7,
                          child: Text(
                            '${initController.pages.data![1].content}',
                            style: mediumtext,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.037,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.width > 450
                                ? 435.r * initController.trips.data!.length
                                : 365.r * initController.trips.data!.length,
                            width: Get.width * 0.86,
                            child: !initController.isTripsReady.value
                                ? GetBuilder<TripsController>(builder: (_) {
                                    return ListView.builder(
                                        controller: _.scrollController,
                                        // physics:
                                        //     const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            initController.trips.data!.length,
                                        itemBuilder: (context, int index) {
                                          return Column(
                                            children: [
                                              TripWidget(
                                                trip: initController
                                                    .trips.data![index],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.025,
                                              )
                                            ],
                                          );
                                        });
                                  })
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: blue1,
                                    ),
                                  )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
