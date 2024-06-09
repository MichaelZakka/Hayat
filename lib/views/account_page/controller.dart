import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/response/login_response.dart';
import 'package:hayat/data/repository/account_repo.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class AccountController extends GetxController {
  AccountRepo accountRepo = AccountRepo();
  RxBool notification = true.obs;
  InitController initController = Get.put(InitController());

  switchNotification() {
    notification.toggle();
    print(notification);
    update();
  }

  getUserData() async {
    LoginResponse? userData =
        await AppStorage.getUserInfoFromSharedPreferences();
    return userData;
  }

  logoutRequest() {
    accountRepo.logout().then((value) async {
      if (value.message == 'You have logged out successfully.') {
        initController.isAuthenticated.value = false;
        await AppStorage.removeToken();
        await AppStorage.setAuthState(false);
        print('logout controller');
        Get.offAllNamed('/loginPage');
      }
    });
  }

  void popup() {
    Get.to(
      CustomPopup(
        content: 'Are you sure you want to logout?',
        title: 'Logout',
        isquestion: true,
        answerontap: () {
          try {
            logoutRequest();
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }

  @override
  void onInit() async {
    notification.value = await AppStorage.getNotificationState();
    super.onInit();
  }
}
