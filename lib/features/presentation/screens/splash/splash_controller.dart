import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_screen.dart';
import 'package:sicpa_news/features/presentation/screens/main/search/search_controller.dart';

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  Rx<Position?> currentPosition = Rxn();
  // StreamSubscription<Position>? positionStream;

  @override
  void onInit() {
    super.onInit();

    Timer(
      const Duration(seconds: 1),
      () {
        SearchController.find.deleteAllArticles();
        determinePosition().then((_) {
          userLocation().then((_) {
            checkAndNavigateUser();
          });
        });
      },
    );
  }

  Future userLocation() async {
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      distanceFilter: 0,
      accuracy: LocationAccuracy.high,
    )).listen((Position position) {
      currentPosition.value = position;
      debugPrint(
          'Current Position: Latitude (${currentPosition.value?.latitude}), Longitude (${currentPosition.value?.longitude})');
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  void checkAndNavigateUser() async {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
