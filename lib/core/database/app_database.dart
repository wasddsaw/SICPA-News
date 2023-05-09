import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sicpa_news/core/database/dao/todo_dao.dart';
import 'package:sicpa_news/core/database/table/todo/todo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
