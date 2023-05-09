import 'dart:async';

import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 1),
      () {
        checkAndNavigateUser();
      },
    );
  }

  void checkAndNavigateUser() async {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
