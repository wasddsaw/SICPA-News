import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/core/database/dao/articles_dao.dart';
import 'package:sicpa_news/core/database/database_util.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';
import 'package:sicpa_news/features/presentation/screens/main/search/search_controller.dart';

class ArticleController extends GetxController {
  ArticlesDao? articlesDao;
  RxList<Articles> articles = RxList();
  RxString searchTxt = RxString('');
  RxBool isHome = RxBool(false);

  final controller = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    articlesDao = DatabaseUtil().getArticlesDao();
    articlesDao ??= await DatabaseUtil().getArticlesDaoAsync();

    debugPrint(Get.previousRoute);

    if (Get.previousRoute == '/search') {
      isHome(false);
      Map<String, dynamic> args = Get.arguments;
      searchTxt.value = args['searchTxt'];

      getSearchArticles();

      controller.addListener(() {
        if (controller.position.maxScrollExtent == controller.offset) {
          int countPage = SearchController.find.countPage.value++;
          if (countPage > 0) {
            SearchController.find
                .getArticlesSearch(
                    '', '', '', '', '', '', '', countPage, searchTxt.value, '')
                .then((_) => getSearchArticles());
          }
        }
      });
    } else if (Get.previousRoute == '/home') {
      isHome(true);
      getArticles();
    }
  }

  Future<void> getSearchArticles() async {
    if (SearchController.find.isError.isFalse) {
      articlesDao?.getAllArticles().then((value) {
        if (SearchController.find.offset.value > 0) {
          value.removeRange(0, value.length - 10);
        }
        articles.addAll(value);
      });
    }
  }

  Future<void> getArticles() async {
    articlesDao?.getAllArticles().then((value) {
      articles.value = value;
    });
  }
}
