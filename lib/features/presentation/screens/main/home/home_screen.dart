import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_screen.dart';
import 'package:sicpa_news/features/presentation/screens/main/home/home_controller.dart';
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
      body: Column(
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
                      debugPrint(ss['id'].toString());
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
                      if (pp['id'] == 0) {
                        controller.getMostViewed(30).then((_) {
                          Get.toNamed(ArticleScreen.routeName)?.then((_) {
                            controller.deleteAllArticles();
                          });
                        });
                      }
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
        ],
      ),
    );
  }
}
