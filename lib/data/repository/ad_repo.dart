import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';

class AdRepo {
  MyHttpClient http = MyHttpClient();

  getAds() async {
    return await http.getRequest(GET_ADS, {}, {'Accept': 'application/json'});
  }
}
