import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';

class NotificationRepo {
  MyHttpClient http = MyHttpClient();

  getNotificaiton(String title, String body) async {
    return await http.postRequest('$baseUrl/api/send-notification',
        {'title': 'ttt', 'body': 'sss'}, {'Accept': 'application/json'});
  }
}
