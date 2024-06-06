import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/plant_response.dart';
import 'package:hayat/res/styles.dart';

class PlantWidget extends StatelessWidget {
  final double width;
  final List<String>? asset;
  final bool isPicture;
  final Color? color;
  final PlantResponse? plant;
  const PlantWidget({
    this.color,
    this.plant,
    super.key,
    required this.width,
    this.asset,
    this.isPicture = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: isPicture
            ? PageView.builder(
                itemCount: asset!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  baseUrl + asset![index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: width,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white, width: 10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          baseUrl + asset![index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              )
            : Stack(
                children: [
                  Row(children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      width: width / 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      width: width / 2,
                    ),
                  ]),
                  Center(
                    child: SizedBox(
                      width: 270.r,
                      height: Get.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35.r,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    'Kingdom',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    '${plant!.kingdom!.title}',
                                    style: consttext,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    'Phylum',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    '${plant!.phylum!.title}',
                                    style: consttext,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    'Class',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    '${plant!.plant_class!.title}',
                                    style: consttext,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    'Family',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    '${plant!.family}',
                                    style: consttext,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    'Genus',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    '${plant!.genus}',
                                    style: consttext,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    'Species',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(
                                  width: 90.r,
                                  child: Text(
                                    textAlign: TextAlign.end,
                                    '${plant!.species}',
                                    style: consttext,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
