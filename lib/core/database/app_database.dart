import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sicpa_news/core/database/dao/articles_dao.dart';
import 'package:sicpa_news/core/database/table/articles/articles.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Articles])
abstract class AppDatabase extends FloorDatabase {
  ArticlesDao get articlesDao;
}
