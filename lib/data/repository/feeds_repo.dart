import 'dart:convert';

import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/api_error_response.dart';
import 'package:hayat/data/http/api_response.dart';
import 'package:hayat/data/http/http_client.dart';
import 'package:hayat/data/models/body/add_post_body.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:http/http.dart' as http1;

class FeedsRepo {
  InitController initController = Get.find();
  MyHttpClient http = MyHttpClient();

  getAllPosts(String page) async {
    return await http.getRequest('$GET_ALL_POSTS&page=$page', {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  getPostById(PostResponse postResponse) async {
    return await http.getRequest('$GET_ALL_POSTS/${postResponse.id}', {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  addPost(AddPostBody addPostBody) async {
    final request = http1.MultipartRequest('POST', Uri.parse(ADD_POST));
    request.fields.addAll({
      "name": "test name",
      "caption": "${addPostBody.caption}",
      "location": "${addPostBody.location}",
    });
    request.files.add(
        await http1.MultipartFile.fromPath('image', '${addPostBody.image}'));
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppStorage.token}'
    });

    final response = await request.send();
    var jsonResponse = await http1.Response.fromStream(response);
    var js = jsonDecode(jsonResponse.body);
    if (response.statusCode == 200) {
      print(response);
      print(response.statusCode);

      return ApiResponse.fromJson(js);
    } else {
      return ApiErrorResponse.fromJson(js);
    }
  }

  getMyFeeds() async {
    print('=================00000000000000000000');
    print(initController.userData!.token);
    return await http.getRequest(MY_POSTS, {}, {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${initController.userData!.token}'
    });
  }

  deleteMyPost(int id) async {
    return await http.deleteRequest('$ADD_POST/$id', {}, {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${initController.userData!.token}'
    });
  }

  likePost(int id) async {
    return await http.postRequest('$ADD_POST/$id/like-toggle', {}, {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${initController.userData!.token}'
    });
  }

  reportPost(int id, String reason) async {
    return await http.postRequest('$ADD_POST/$id/report', {
      'reason': reason
    }, {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${initController.userData!.token}'
    });
  }
}
