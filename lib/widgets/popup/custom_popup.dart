import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? ontap;
  final VoidCallback? answerontap;
  final bool isquestion;
  final bool isLoading;
  const CustomPopup({
    this.isLoading = false,
    required this.content,
    required this.title,
    this.isquestion = false,
    this.ontap,
    this.answerontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(193, 215, 225, 1),
        body: !isLoading
            ? AlertDialog(
                shadowColor: Colors.black,
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  title,
                  style: medium_bold,
                ),
                content: SizedBox(
                    width: Get.width * 0.8,
                    child: Text(
                      content,
                      style: smalltext1,
                    )),
                actions: <Widget>[
                  !isquestion
                      ? GestureDetector(
                          onTap: ontap,
                          child: Container(
                            decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.circular(8)),
                            width: Get.width * 0.18,
                            height: 55.r,
                            child: Center(
                              child: Text(
                                'OK',
                                style: mediumtext,
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AuthButton(
                              containercolor: Colors.transparent,
                              textcolor: black,
                              text: 'NO',
                              textstyle: consttext,
                              width: Get.width * 0.175,
                              ontap: () {
                                Get.back();
                              },
                            ),
                            AuthButton(
                              containercolor: yellow,
                              textcolor: black,
                              text: 'YES',
                              textstyle: consttext,
                              width: Get.width * 0.175,
                              ontap: answerontap,
                            )
                          ],
                        )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: blue1,
                ),
              ));
  }
}
