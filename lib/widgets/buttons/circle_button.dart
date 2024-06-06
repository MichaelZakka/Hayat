import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/res/styles.dart';

class CircleButton extends StatelessWidget {
  final String icon;
  final String? text1;
  final String? text2;
  final double width;
  final TextStyle? textstyle;
  final bool istext;

  final VoidCallback onTap;
  const CircleButton({
    required this.icon,
    this.text1,
    this.text2,
    required this.width,
    required this.onTap,
    this.istext = true,
    this.textstyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              width:  width,
              height: width,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: icon.endsWith('svg')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(600),
                      child: SvgPicture.asset(
                        icon,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(600),
                      child: Image.network(
                        baseUrl + icon,
                        fit: BoxFit.cover,
                      ),
                    )),
          const SizedBox(
            height: 10,
          ),
          istext
              ? SizedBox(
                  width: Get.width * 0.3,
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      text1 ?? "",
                      style: textstyle ?? largetext,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
