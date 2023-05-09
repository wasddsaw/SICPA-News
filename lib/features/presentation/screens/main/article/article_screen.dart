import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sicpa_news/features/presentation/components/shared/shared.dart';
import 'package:sicpa_news/features/presentation/screens/main/article/article_controller.dart';
import 'package:sicpa_news/features/presentation/utils/common.dart';

class ArticleScreen extends GetView<ArticleController> {
  const ArticleScreen({super.key});

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.articles.length + 1,
          itemBuilder: (context, index) {
            if (index < controller.articles.length) {
              final article = controller.articles[index];
              return ListTile(
                title: Text(
                  article.title.toString(),
                  style: CustomTextStyles.bodyText5TextStyle,
                ),
                subtitle: Text(
                  Jiffy(article.datePublished).format('d MMM yyyy'),
                  style: CustomTextStyles.subtitle,
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: LoadingIndicator(),
                ),
              );
            }
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Divider(),
            );
          },
        ),
      ),
    );
  }
}
