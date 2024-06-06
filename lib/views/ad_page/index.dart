import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class AdPage extends StatelessWidget {
  AdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GetBuilder<InitController>(builder: (_) {
          return _.isAdsReady.value
              ? _.ads.data!.isEmpty
                  ? PageView.builder(
                      itemCount: _.ads.data!.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          baseUrl + _.ads.data![index].originalUrl!,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : SvgPicture.asset(
                      AD_BACKGROUND,
                      fit: BoxFit.cover,
                      width: Get.width,
                    )
              : SvgPicture.asset(
                  AD_BACKGROUND,
                  fit: BoxFit.cover,
                  width: Get.width,
                  height: Get.height,
                );
        }),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              child: AuthButton(
                width: Get.width * 0.86,
                containercolor: yellow,
                textcolor: Colors.black,
                text: 'SKIP',
                ontap: () async {
                  Get.offAllNamed('/loginPage');
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            )
          ],
        ),
      ],
    ));
  }
}
