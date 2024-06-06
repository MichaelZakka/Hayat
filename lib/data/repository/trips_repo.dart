import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';

class TripsRepo {
  MyHttpClient http = MyHttpClient();

  getAllTrips(String id) async {
    return await http.getRequest('$ALL_TRIPS?page=$id', {}, {'Accept': 'application/json'});
  }

  getTripById(int id) async {
    return await http.getRequest('$ALL_TRIPS/$id', {}, {'Accept': 'application/json'});
  }
}
