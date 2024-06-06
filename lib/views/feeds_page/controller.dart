import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/get_feeds_response.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/data/repository/feeds_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class FeedsController extends GetxController {
  String pickedImage = '';
  FeedsRepo feedsRepo = FeedsRepo();
  GetFeedsResponse feeds = GetFeedsResponse();
  RxBool loading = true.obs;
  RxBool indicator = false.obs;
  Color color = Colors.grey;
  RxBool isDataReady = false.obs;
  ScrollController scrollController = ScrollController();

  getColor(int id) async {
    PostResponse post = await getPostByIdRequest(id);
    if (post.likedByMe == 1) {
      color = blue1;
    } else if (post.likedByMe == 0) {
      color = Colors.grey;
    }
    return color;
  }

  void onEndScroll() {
    int nextPage = feeds.meta!.currentPage! + 1;
    print(nextPage);
    if (feeds.links!.next != null) {
      getOtherpostsRequest('$nextPage');
    }
    print('Reached end of ListView');
  }

  sharePost(int id) {
    Share.share('$baseUrl/public/api/posts/$id');
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onEndScroll();
      }
    });
  }

  isReady() {
    isDataReady.toggle();
    update();
  }

  likeToggle() {
    if (color == blue1) {
      color = Colors.grey;
    } else if (color == Colors.grey) {
      color = blue1;
    }
    update();
  }

  likeToggle1(Color color1) {
    if (color1 == blue1) {
      color1 = Colors.grey;
    } else if (color1 == Colors.grey) {
      color1 = blue1;
    }
    update();
  }

  isLoading() {
    if (loading.value) {
      loading.value = false;
    }
    update();
  }

  Future<bool> locationPermission() async {
    var locationpermission = await Permission.location.request();
    if (locationpermission.isGranted) {
      return true;
    }
    return false;
  }

  Future<bool> cameraPermission() async {
    var locationpermission = await Permission.camera.request();
    if (locationpermission.isGranted) {
      return true;
    }
    return false;
  }

  void askLocationPermission() async {
    if (!(await locationPermission())) {
      await Permission.location.request();
    }
  }

  pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedImage = pickedFile.path;
      Get.toNamed('/addpostPage');
    }
    print('------');
    print(pickedImage);
    update();
  }

  Future<PostResponse> getPostByIdRequest(int id) async {
    PostResponse post = PostResponse();
    feedsRepo.getPostById(PostResponse(id: id)).then((value) {
      if (value.status == 200) {
        // print(value.data);
        // isLoading();
        post = PostResponse.fromJson(value.data);
        print(post.userName);
        return value.data;
      }
    });
    return post;
  }

  Future<GetFeedsResponse> getAllpostsRequest(String page) async {
    try {
      feedsRepo.getAllPosts(page).then((value) {
        if (value.message == 'All posts') {
          print('all posts');
          isReady();
          print(value.data);
          feeds = GetFeedsResponse.fromJson(value.data);
          isLoading();
        }
      });
    } catch (e) {
      print(e);
    }
    return feeds;
  }

  Future<GetFeedsResponse> getOtherpostsRequest(String page) async {
    GetFeedsResponse feedPage;
    try {
      feedsRepo.getAllPosts(page).then((value) {
        if (value.message == 'All posts') {
          feedPage = GetFeedsResponse.fromJson(value.data);
          feeds.merge(feedPage);
        }
      });
    } catch (e) {
      print(e);
    }
    return feeds;
  }

  likePost(int id) {
    feedsRepo.likePost(id).then((value) {
      if (value.status == 200) {
        // likeToggle();
        print(value.message);
      }
    });
  }
}
