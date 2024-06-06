import 'package:get/get.dart';
import 'package:hayat/data/models/response/all_colors_response.dart';
import 'package:hayat/data/repository/plants_repo.dart';
import 'package:hayat/views/color_page/controller.dart';

class ByColorController extends GetxController {
  PlantsRepo plantsRepo = PlantsRepo();
  AllColorsResponse colors = AllColorsResponse();
  ColorController colorController = Get.put(ColorController());

  getAllColorsRequest() {
    plantsRepo.getAllColors().then((value) {
      if (value.message == 'All colors') {
        colors = AllColorsResponse.fromJson(value.data);
        print(colors.data![0].id);
      } else {
        print('---------');
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    colorController.getAllPlantsRequest('1',null, null);
  }
}
