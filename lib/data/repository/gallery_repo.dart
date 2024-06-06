import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';

class GalleryRpeo {
  MyHttpClient http = MyHttpClient();

  getGalleryImages(String id) async {
    return await http.getRequest('$GALLERY_IMAGES?page=$id', {}, {'Accept':'application/json'});
  }
}
