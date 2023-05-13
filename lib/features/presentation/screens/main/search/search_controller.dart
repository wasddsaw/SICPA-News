import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/core/database/dao/articles_dao.dart';
import 'package:sicpa_news/core/database/database_util.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';
import 'package:sicpa_news/features/domain/repositories/most_popular_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sicpa_news/features/presentation/utils/overlay_utils.dart';

class SearchController extends GetxController {
  late MostPopularRepository mostPopularRepository;

  SearchController({
    required this.mostPopularRepository,
  });

  TextEditingController searchController = TextEditingController(text: "");

  ArticlesDao? articlesDao;

  @override
  void onInit() async {
    super.onInit();
    articlesDao = DatabaseUtil().getArticlesDao();
    articlesDao ??= await DatabaseUtil().getArticlesDaoAsync();
  }

  Future<void> getArticlesSearch(
      String beginDate,
      String endDate,
      String facet,
      String facetFields,
      String facetFilter,
      String f1,
      String fq,
      int page,
      String query,
      String sort) async {
    OverlayUtils.showLoading();
    try {
      final response = await mostPopularRepository.articleSearch(beginDate,
          endDate, facet, facetFields, facetFilter, f1, fq, page, query, sort);
      if (response['status'] == 'OK') {
        for (var r in response['response']['docs']) {
          articlesDao?.insertArticle(
            Articles(
              null,
              r['headline']['main'],
              r['pub_date'],
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
