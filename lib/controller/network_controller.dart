import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  Connectivity get() {
    return _connectivity;
  }

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(changeConnectivityStatus);
  }

  changeConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      print(result);
      Get.rawSnackbar(
          messageText: Text(
            'Please check your internet connection',
            style: medium_white,
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: red,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        print(result);

        Get.closeCurrentSnackbar();
      }
    }
    update();
  }

  networkConnection() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return result;
  }
}
