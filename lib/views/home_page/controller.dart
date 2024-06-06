import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/response/delete_account_reason_response.dart';
import 'package:hayat/data/repository/account_repo.dart';
import 'package:hayat/views/by_letters_page/controller.dart';
import 'package:hayat/views/color_page/controller.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/views/my_feeds_page/controller.dart';
import 'package:hayat/views/my_questions_page/controller.dart';
import 'package:hayat/views/weather_page/controller.dart';

class HomePageController extends GetxController {
  ColorController colorController = Get.put(ColorController());
  FeedsController feedsController = Get.put(FeedsController());
  InitController initController = Get.put(InitController());
  WeatherController weatherController = Get.put(WeatherController());
  MyFeedsController myFeedsController = Get.put(MyFeedsController());
  ByLettersController byLettersController = Get.put(ByLettersController());
  MyQuestionsController myQuestionsController =
      Get.put(MyQuestionsController());
  AccountRepo accountRepo = AccountRepo();
  DeleteAccountReasonResponse reasons = DeleteAccountReasonResponse();

  getDeleteReason() {
    accountRepo.getDeleteAccountReasons().then((value) {
      if (value.status == 200) {
        print('reasons');
        reasons = DeleteAccountReasonResponse.fromJson(value.data);
        print(reasons.data![0].reason);
      }
    });
  }

  @override
  void onInit()async {
    colorController.getAllPlantsRequest('1', null, null);
    byLettersController.getPlantsByLetterRequest('1');
    feedsController.getAllpostsRequest('1');
    weatherController.getWeatherRequest();
    myFeedsController.myFeedRequest();
    myQuestionsController.getMyQuestionsRequest('1');
    initController.getInitialData();
    getDeleteReason();
    var userData = await AppStorage.getUserInfoFromSharedPreferences();
    print('=============================');
    print(await AppStorage.getToken());
    print('onInitHomeController');
    print(userData!.user!.fullName);
    print('=============================');
    super.onInit();
  }
}
