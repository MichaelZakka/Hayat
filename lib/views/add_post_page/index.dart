import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/add_post_page/controller.dart';
import 'package:hayat/views/add_post_page/widgets/add_post_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddPostController>(builder: (_) {
        return SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                BLUE_BACKGROUND4,
                fit: BoxFit.cover,
                width: Get.width,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomAppBar(title: 'Add Post'),
                      SizedBox(
                        width: Get.width * 0.86,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AddPostImage(),
                            SizedBox(height: Get.height * 0.033),
                            Text(
                              'Write A Caption',
                              style: consttext,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            AuthTextfield(
                              textEditingController: _.captionController,
                              obsecurity: false,
                              height: Get.height * 0.110,
                            ),
                            SizedBox(height: Get.height * 0.035),
                            Container(
                              alignment: Alignment.center,
                              child: AuthButton(
                                containercolor: yellow,
                                textcolor: Colors.black,
                                text: 'SHARE',
                                ontap: () {
                                  if (_.captionController.text.isEmpty) {
                                    _.validation(
                                        'Caption cannot be empty', red);
                                  } else {
                                    _.isLoading();
                                    _.addPostRequset();
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _.loading.value
                  ? Container(
                      width: Get.width,
                      height: Get.height,
                      color: Colors.white.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: blue1,
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      }),
    );
  }
}
