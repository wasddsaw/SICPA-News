import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
    Get.put(
      SplashController(),
      permanent: true,
    );
  }
}
