import 'package:get/get.dart';
import 'package:sicpa_news/core/database/dao/articles_dao.dart';
import 'package:sicpa_news/core/database/database_util.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';

class ArticleController extends GetxController {
  ArticlesDao? articlesDao;
  RxList<Articles> articles = RxList();

  @override
  void onInit() async {
    super.onInit();
    articlesDao = DatabaseUtil().getArticlesDao();
    articlesDao ??= await DatabaseUtil().getArticlesDaoAsync();

    getArticles();
  }

  Future<void> getArticles() async {
    articlesDao?.getAllArticles().then((value) {
      articles.value = value;
    });
  }
}
