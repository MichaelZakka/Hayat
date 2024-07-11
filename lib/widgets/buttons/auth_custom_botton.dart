import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final Color containercolor;
  final Color textcolor;
  final double? width;
  final TextStyle? textstyle;
  final String text;
  final VoidCallback? ontap;
  const AuthButton(
      {required this.containercolor,
      required this.textcolor,
      this.textstyle,
      required this.text,
      this.width,
      this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap ?? (){},
      child: Container(
        width: width ?? 355.r,
        height: 44.r,
        decoration: BoxDecoration(
            color: containercolor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: textstyle ??
                TextStyle(
                    fontSize: 18,
                    color: textcolor,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
