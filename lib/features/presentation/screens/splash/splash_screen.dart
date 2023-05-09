import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/splash/splash_controller.dart';
import 'package:sicpa_news/features/presentation/utils/common.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(),
    );
  }
}
