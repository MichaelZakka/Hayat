import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';
import 'package:hayat/data/models/body/update_user_body.dart';

class AccountRepo {
  final MyHttpClient http = MyHttpClient();
  InitController initController = Get.put(InitController());

  logout() async {
    return await http.postRequest(LOG_OUT, {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  updateuserRequest(UpdateUserBody updateUserBody) async {
    return await http.putRequest(UPDATE_USER, updateUserBody.toJson(), {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  deleteAccountRequest() async {
    return await http.deleteRequest(DELETE_ACCOUNT, {},
        {"Accept": "application/json", "Authorization": "${initController.userData!.token}"});
  }

  getDeleteAccountReasons() async {
    return await http.getRequest(REASONS, {}, {"Accept": "application/json"});
  }
}
