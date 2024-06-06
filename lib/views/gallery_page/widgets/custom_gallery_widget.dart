import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/views/gallery_page/controller.dart';

class CustomGalleryWidget extends StatelessWidget {
  CustomGalleryWidget({super.key});
  final InitController initController = Get.find();
  final GalleryController _galleryController = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width * 0.86,
        child: GridView.builder(
          controller: _galleryController.scrollController,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: initController.images.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return PictureWidget(
                        image: initController.images.data![index].originalUrl!,
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    baseUrl + initController.images.data![index].originalUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({required this.image, super.key});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightcyan2,
      body: Center(
        child: SizedBox(
          width: Get.width * 0.95,
          child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                baseUrl + image,
              )),
        ),
      ),
    );
  }
}
