import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/res/styles.dart';

class VerifyBox extends StatelessWidget {
  VerifyBox({super.key});

  final List<String> widgetData = [
    'Widget 1',
    'Widget 2',
    'Widget 3',
    'Widget 4',
    'Widget 5',
    'Widget 6',
  ];

  final List<FocusNode> focusnode = List.generate(6, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: Get.width * 0.12,
          height: Get.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(138, 176, 190, 1)),
          child: TextFormField(
              onChanged: (value) {
                FocusScope.of(context).requestFocus(focusnode[1]);
              },
              focusNode: focusnode[0],
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
              )),
        ),
        Container(
          width: Get.width * 0.12,
          height: Get.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(138, 176, 190, 1)),
          child: TextFormField(
              focusNode: focusnode[1],
              onChanged: (value) {
                FocusScope.of(context).requestFocus(focusnode[2]);
              },
              maxLength: 1,
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              )),
        ),
        Container(
          width: Get.width * 0.12,
          height: Get.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(138, 176, 190, 1)),
          child: TextFormField(
              focusNode: focusnode[2],
              onChanged: (value) {
                FocusScope.of(context).requestFocus(focusnode[3]);
              },
              maxLength: 1,
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              )),
        ),
        Container(
          width: Get.width * 0.12,
          height: Get.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(138, 176, 190, 1)),
          child: TextFormField(
              focusNode: focusnode[3],
              onChanged: (value) {
                FocusScope.of(context).requestFocus(focusnode[4]);
              },
              maxLength: 1,
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              )),
        ),
        Container(
          width: Get.width * 0.12,
          height: Get.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(138, 176, 190, 1)),
          child: TextFormField(
              focusNode: focusnode[4],
              onChanged: (value) {
                FocusScope.of(context).requestFocus(focusnode[5]);
              },
              maxLength: 1,
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              )),
        ),
        Container(
          width: Get.width * 0.12,
          height: Get.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(138, 176, 190, 1)),
          child: TextField(
              focusNode: focusnode[5],
              onChanged: (value) {},
              maxLength: 1,
              textAlignVertical: TextAlignVertical.top,
              showCursor: false,
              style: textStyleForButton,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              )),
        ),
      ],
    );
  }
}
