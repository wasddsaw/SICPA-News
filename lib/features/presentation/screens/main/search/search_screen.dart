import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/features/presentation/components/shared/shared.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_screen.dart';
import 'package:sicpa_news/features/presentation/screens/main/search/search_controller.dart'
    as sc;

class SearchScreen extends GetView<sc.SearchController> {
  const SearchScreen({super.key});

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomInput(
                placeholder: 'Search articles here...',
                controller: controller.searchController,
                withHorizontalPadding: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: CustomButton(
                label: 'Search',
                onPressed: () {
                  controller
                      .getArticlesSearch(
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          '',
                          controller.countPage.value,
                          controller.searchController.text,
                          '')
                      .then((_) {
                    controller.countPage(1);
                    Get.toNamed(
                      ArticleScreen.routeName,
                      arguments: {
                        'searchTxt': controller.searchController.text,
                      },
                    )?.then((_) {
                      controller.deleteAllArticles();
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
