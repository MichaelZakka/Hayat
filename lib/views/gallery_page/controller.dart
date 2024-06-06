import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/response/gallery_response.dart';
import 'package:hayat/data/repository/gallery_repo.dart';

class GalleryController extends GetxController {
  final InitController _initController = Get.put(InitController());
  GalleryRpeo galleryRpeo = GalleryRpeo();

  ScrollController scrollController = ScrollController();

  void onEndScroll() {
    int nextPage = _initController.images.meta!.currentPage! + 1;
    print(nextPage);
    if (_initController.images.links!.next != null) {
      getOtherGalleryImagesRequest('$nextPage');
    }
    print('Reached end of ListView');
  }

  getOtherGalleryImagesRequest(String id) {
    GalleryResponse other = GalleryResponse();
    galleryRpeo.getGalleryImages(id).then((value) {
      if (value.status == 200) {
        print('gallery');
        _initController.images.merge(other);
      }
    });
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
}
