import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/core/constant/map.dart';
import 'package:sicpa_news/core/database/dao/articles_dao.dart';
import 'package:sicpa_news/core/database/database_util.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';
import 'package:sicpa_news/features/domain/repositories/most_popular_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sicpa_news/features/presentation/utils/overlay_utils.dart';

class HomeController extends GetxController {
  late MostPopularRepository mostPopularRepository;

  HomeController({
    required this.mostPopularRepository,
  });

  RxList popular = RxList();
  RxList search = RxList();

  ArticlesDao? articlesDao;

  @override
  void onInit() async {
    super.onInit();
    popular.value = Constant.popular['data'];
    search.value = Constant.search['data'];
    articlesDao = DatabaseUtil().getArticlesDao();
    articlesDao ??= await DatabaseUtil().getArticlesDaoAsync();
  }

  Future<void> getMostViewed(int period) async {
    OverlayUtils.showLoading();
    try {
      final response = await mostPopularRepository.mostViewed(period);
      if (response['status'] == 'OK') {
        for (var r in response['results']) {
          articlesDao?.insertArticle(
            Articles(
              null,
              r['title'],
              r['published_date'],
            ),
          );
        }
      }
    } catch (error) {
      var message = "Response error, please try again";
      if (error is dio.Response) {
        message = error.data;
      }
      Get.showSnackbar(
        GetSnackBar(
          message: message,
          duration: const Duration(seconds: 1),
        ),
      );
      debugPrint('$error');
    }
    OverlayUtils.closeLoading();
  }

  void deleteAllArticles() {
    articlesDao?.deleteAllArticles();
  }
}
