import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/controller/network_controller.dart';
import 'package:hayat/data/models/response/ads_response.dart';
import 'package:hayat/data/repository/ad_repo.dart';

class SplashController extends GetxController {
  AdsResponse ads = AdsResponse();
  AdRepo adRepo = AdRepo();

  InitController initController = Get.put(InitController());
  NetworkController networkController = Get.put(NetworkController());

  @override
  void onInit() async {
    // checkConnectiviy();
    if (await networkController.get().checkConnectivity() ==
            ConnectivityResult.wifi ||
        await networkController.get().checkConnectivity() ==
            ConnectivityResult.mobile) {
      if (await AppStorage.getAuthState() == false) {
        Future.delayed(Duration(seconds: 5), () async {
          print('splash');
          Get.offAllNamed('/adPage');
        });
      } else {
        Future.delayed(Duration(seconds: 5), () {
          Get.offAllNamed('/mainPage');
        });
      }
      // } else {
      //   Future.delayed(Duration(seconds: 5), () async {
      //     Get.offAllNamed('/mainPage');
      //   });
      // }
    }

    // initController.validation('No Internet Connection', red);
    // }
    //   }
    // } else {
    // Get.toNamed('/mainPage');
    // }

    super.onInit();
  }
  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
