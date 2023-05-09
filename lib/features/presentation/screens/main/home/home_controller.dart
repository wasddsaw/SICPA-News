import 'package:get/get.dart';
import 'package:sicpa_news/core/constant/map.dart';

class HomeController extends GetxController {
  RxList popular = RxList();
  RxList search = RxList();

  @override
  void onInit() {
    super.onInit();
    popular.value = Constant.popular['data'];
    search.value = Constant.search['data'];
  }
}
