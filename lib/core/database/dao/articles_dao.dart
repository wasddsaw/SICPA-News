import 'package:floor/floor.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';

@dao
abstract class ArticlesDao {
  @Query('SELECT * FROM Articles')
  Future<List<Articles>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertArticle(Articles item);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateArticle(Articles item);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateMultipleArticles(List<Articles> items);

  @delete
  Future<void> deleteArticle(Articles todo);

  @Query('DELETE FROM Articles')
  Future<void> deleteAllArticles();
}
