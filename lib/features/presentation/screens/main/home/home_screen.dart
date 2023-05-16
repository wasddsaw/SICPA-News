import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/components/widgets/app_badge.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_screen.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_controller.dart';
import 'package:sicpa_news/features/presentation/screens/main/search/search_screen.dart';
import 'package:sicpa_news/features/presentation/screens/splash/splash_controller.dart';
import 'package:sicpa_news/features/presentation/utils/common.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NYT'),
        centerTitle: true,
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          if (connectivity == ConnectivityResult.none) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Popular',
                    style: CustomTextStyles.bodyText7TextStyle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: DottedLine(
                    dashColor: AppColors.subTitle,
                  ),
                ),
                Obx(
                  () => Expanded(
                    child: ListView.separated(
                      itemCount: controller.popular.length,
                      itemBuilder: (context, index) {
                        final pp = controller.popular[index];
                        return ListTile(
                          onTap: () {
                            Get.toNamed(ArticleScreen.routeName);
                          },
                          title: Text(
                            pp['title'],
                            style: CustomTextStyles.bodyText1TextStyle,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Divider(),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const AppBadge(
                              text: 'Offline Mode',
                              size: 10,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                'Latitude: ${SplashController.find.currentPosition.value?.latitude}, Longitude: ${SplashController.find.currentPosition.value?.longitude}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return child;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Search',
                style: CustomTextStyles.bodyText7TextStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: DottedLine(
                dashColor: AppColors.subTitle,
              ),
            ),
            Obx(
              () => SizedBox(
                height: 60,
                child: ListView.separated(
                  itemCount: controller.search.length,
                  itemBuilder: (context, index) {
                    final ss = controller.search[index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(SearchScreen.routeName);
                      },
                      title: Text(
                        ss['title'],
                        style: CustomTextStyles.bodyText1TextStyle,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular',
                style: CustomTextStyles.bodyText7TextStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: DottedLine(
                dashColor: AppColors.subTitle,
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.separated(
                  itemCount: controller.popular.length,
                  itemBuilder: (context, index) {
                    final pp = controller.popular[index];
                    return ListTile(
                      onTap: () {
                        controller.getMostPopular(1, pp['id']).then((_) {
                          Get.toNamed(ArticleScreen.routeName);
                        });
                      },
                      title: Text(
                        pp['title'],
                        style: CustomTextStyles.bodyText1TextStyle,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const AppBadge(
                          text: 'Online Mode',
                          size: 10,
                          color: AppColors.green,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                            'Latitude: ${SplashController.find.currentPosition.value?.latitude}, Longitude: ${SplashController.find.currentPosition.value?.longitude}'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
