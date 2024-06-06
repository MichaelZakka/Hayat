import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayat/res/styles.dart';

class AuthPlatformButton extends StatelessWidget {
  final Color containercolor;
  final Color textcolor;
  final String text;
  final String route;
  final VoidCallback ontap;
  final String icon;
  const AuthPlatformButton(
      {required this.containercolor,
      required this.textcolor,
      required this.text,
      required this.ontap,
      required this.route,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 40.r,
        decoration: BoxDecoration(
            color: containercolor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 18.r,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: tinyText,
                    color: textcolor,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
