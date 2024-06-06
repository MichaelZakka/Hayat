import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class AuthTextfield extends StatelessWidget {
  final bool obsecurity;
  final double? height;
  final Color? color;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;

  const AuthTextfield({
    this.hintText,
    this.color,
    required this.obsecurity,
    this.height,
    this.textInputType,
    this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 50.r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: color ?? cyan),
      child: TextFormField(
          keyboardType: textInputType ?? TextInputType.name,
          controller: textEditingController ?? null,
          style: smalltext1,
          cursorColor: Colors.black,
          obscureText: obsecurity,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              border: InputBorder.none,
              hintText: hintText ?? 'Enter here',
              hintStyle: smalltext1)),
    );
  }
}
