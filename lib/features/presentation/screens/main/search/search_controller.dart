import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicpa_news/core/database/dao/articles_dao.dart';
import 'package:sicpa_news/core/database/database_util.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';
import 'package:sicpa_news/features/domain/repositories/most_popular_repository.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sicpa_news/features/presentation/utils/overlay_utils.dart';

class SearchController extends GetxController {
  static SearchController get find => Get.find();

  late MostPopularRepository mostPopularRepository;

  SearchController({
    required this.mostPopularRepository,
  });

  TextEditingController searchController = TextEditingController(text: "");
  ArticlesDao? articlesDao;
  RxInt countPage = RxInt(0);
  RxInt offset = RxInt(0);
  RxBool isError = RxBool(false);

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
    if (countPage.value == 0) {
      OverlayUtils.showLoading();
    }
    try {
      final response = await mostPopularRepository.articleSearch(beginDate,
          endDate, facet, facetFields, facetFilter, f1, fq, page, query, sort);
      debugPrint('offset: ${response['response']['meta']['offset']}');
      debugPrint('articles count: ${response['response']['docs'].length}');
      offset.value = response['response']['meta']['offset'];
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
        isError(false);
      }
    } catch (error) {
      var message = "Response error, please try again";
      if (error is dio.Response) {
        if (error.statusCode == 429) {
          message = error.data['fault']['faultstring'];
        }
      }
      Get.showSnackbar(
        GetSnackBar(
          message: message,
          duration: const Duration(seconds: 1),
        ),
      );
      debugPrint('$error');
      isError(true);
    }
    if (countPage.value == 0) {
      OverlayUtils.closeLoading();
    }
  }

  void deleteAllArticles() {
    articlesDao?.deleteAllArticles();
    countPage.value = 0;
  }
}
