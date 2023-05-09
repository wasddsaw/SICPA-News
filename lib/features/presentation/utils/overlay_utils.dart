import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/components/shared/shared.dart';

class OverlayUtils {
  static void showErrorSnackbar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  static void showLoading({String? message}) {
    Get.dialog(
      AlertDialog(
        content: Wrap(
          children: const [
            LoadingIndicator(),
          ],
        ),
      ),
    );
  }

  static void closeLoading() {
    Get.back();
  }
}
