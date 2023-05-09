import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => HomeController(mostPopularRepository: Get.find()),
    );
    Get.put(
      HomeController(mostPopularRepository: Get.find()),
    );
  }
}
