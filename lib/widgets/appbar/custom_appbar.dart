import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? SvgAsset;
  final bool secondIcon;
  final bool isText;
  final String? icon;

  final VoidCallback? ontap;
  const CustomAppBar(
      {super.key,
      this.SvgAsset,
      this.ontap,
      this.icon,
      this.secondIcon = false,
      this.isText = false,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      leading: CustomLeading(
        title: title,
        SvgAsset: SvgAsset,
      ),
      actions: [
        if (secondIcon)
          GestureDetector(
            onTap: ontap,
            child: SizedBox(
                width: 63.r,
                child: Center(child: SvgPicture.asset(icon!))),
          ),
        if (isText)
          GestureDetector(
            onTap: ontap,
            child: SizedBox(
                width: 63.r,
                child: Center(
                    child: Text(
                  'Edit',
                  style: smalltext2,
                ))),
          )
      ],
      leadingWidth: Get.width,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomLeading extends StatelessWidget {
  final String title;
  final SvgAsset;
  const CustomLeading({required this.title, this.SvgAsset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Row(
        children: [
          SizedBox(
            width: Get.width * 0.067,
          ),
          SvgPicture.asset(SvgAsset ?? BACK_ARROW_ICON),
          SizedBox(
            width: Get.width * 0.025,
          ),
          Text(
            title,
            style: consttext,
          )
        ],
      ),
    );
  }
}
