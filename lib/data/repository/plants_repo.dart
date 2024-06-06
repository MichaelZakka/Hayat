import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';

class PlantsRepo {
  MyHttpClient http = MyHttpClient();

  getAllColors() async {
    return await http
        .getRequest(GET_ALL_COLORS, {}, {'Accept': 'appication/json'});
  }

  getAllPlants(String page, int? id, String? search) async {
    String url = '$GET_ALL_PLANTS?page=$page';
    print(url);
    if (id != null && search != null) {
      url =
          '$GET_ALL_PLANTS?filter[color]=$id&filter[search]=$search&?page=$page';
    } else if (id != null && search == null) {
      url = '$GET_ALL_PLANTS?filter[color]=$id&?page=$page';
    } else if (id == null && search != null) {
      url = '$GET_ALL_PLANTS?filter[search]=$search&?page=$page';
    }
    return await http.getRequest(url, {}, {'Accept': 'application/json'});
  }

  getPlantById(int id) async {
    return await http
        .getRequest('$GET_ALL_PLANTS/$id', {}, {'Accept': 'application/json'});
  }

  getPlantsByLetter(String page) async {
    return await http.getRequest('$GET_ALL_PLANTS/?sort=name&page=$page', {},
        {'Accept': 'application/json'});
  }
}
