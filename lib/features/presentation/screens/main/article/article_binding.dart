import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_controller.dart';

class ArticleBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ArticleController(),
    );
  }
}
