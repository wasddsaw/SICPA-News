import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SearchController(mostPopularRepository: Get.find()),
    );
    Get.put(
      SearchController(mostPopularRepository: Get.find()),
    );
  }
}
