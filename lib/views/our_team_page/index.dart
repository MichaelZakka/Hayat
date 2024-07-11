import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/our_team_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class OurTeamPage extends StatelessWidget {
  OurTeamPage({super.key});
  final InitController initController = Get.put(InitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              BLUE_BACKGROUND3,
              fit: BoxFit.cover,
              width: Get.width,
            ),
            Center(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: '${initController.pages.data![2].title}',
                      ),
                      SizedBox(height: Get.height * 0.05),
                      CircleButton(
                        icon: OUR_TEAM_ICON,
                        width: 150.r,
                        onTap: () {},
                      ),
                      AuthButton(
                        containercolor: yellow,
                        textcolor: black,
                        width: 210.r,
                        text: '${initController.pages.data![2].title}',
                      ),
                      SizedBox(
                        height: Get.height * 0.037,
                      ),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Text(
                          '${initController.pages.data![2].content}',
                          style: mediumtext,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.037,
                      ),
                      CircleButton(
                          icon: OUR_TEAM_WIDGET_ICON,
                          width: 0.37,
                          onTap: () {}),
                      SvgPicture.asset(OUR_TEAM_WIDGET_ICON2),
                      SizedBox(height: Get.height * 0.037),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Text(
                            textAlign: TextAlign.center,
                            style: mediumtext,
                            'HAYAT wildlife conservation team are a passionate group of researchers and experienced volunteers that work across different sectors in the state of kuwait, and are brought together by wildlife conservation. '),
                      ),
                      SizedBox(height: Get.height * 0.037),
                      AuthButton(
                        containercolor: yellow,
                        textcolor: black,
                        text: 'MEMBERS',
                        width: 210.r,
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      initController.teamMembers.data!.isNotEmpty
                          ? SizedBox(
                              height: 224.r *
                                  initController.teamMembers.data!.length,
                              child:
                                  GetBuilder<OurTeamController>(builder: (_) {
                                return ListView.builder(
                                    controller: _.scrollController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        initController.teamMembers.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleButton(
                                          icon: initController.teamMembers
                                              .data![index].picture!,
                                          width: 150.r,
                                          onTap: () {},
                                          text1:
                                              '${initController.teamMembers.data![index].fullName}',
                                          textstyle: materialfont,
                                        ),
                                      );
                                      // SizedBox(height: Get.height * 0.05),;
                                    });
                              }),
                            )
                          : SizedBox()
                      // CircleButton(

                      //   icon: TEAM_MEMBER_ICON,
                      //   width: 0.37,
                      //   onTap: () {},
                      //   text1: 'NOUF ALHASHSASH',
                      //   textstyle: medium_white,
                      // ),
                      // SizedBox(
                      //   height: Get.height * 0.02,
                      // ),
                      // CircleButton(
                      //   icon: TEAM_MEMBER_ICON,
                      //   width: 0.37,
                      //   onTap: () {},
                      //   text1: 'NOUF ALHASHSASH',
                      //   textstyle: medium_white,
                      // )
                      // CircleButton(
                      //     icon: FLORA_ICON,
                      //     width: Get.width * 0.37,
                      //     text1: 'NOUF ALHASHSASH',
                      //     textstyle: mediumtext,
                      //     onTap: () {})
                    ],
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
