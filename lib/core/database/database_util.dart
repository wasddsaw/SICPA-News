import 'package:floor/floor.dart';
import 'package:sicpa_news/core/database/dao/todo_dao.dart';
import 'app_database.dart';

class DatabaseUtil {
  static final DatabaseUtil instance = DatabaseUtil.init();
  static TodoDao? todoDao;

  factory DatabaseUtil() {
    return instance;
  }

  DatabaseUtil.init() {
    initDB();
  }

  initDB() {
    final database = $FloorAppDatabase
        .databaseBuilder('pad_database.db')
        //.addMigrations([migration1to2])
        .build();

    database.then((value) {
      todoDao = value.todoDao;
    });
  }

  TodoDao? getTodoDao() {
    if (todoDao == null) {
      initDB();
      return null;
    } else {
      return todoDao;
    }
  }

  Future<TodoDao?> getTodoDaoAsync() async {
    AppDatabase database = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        //.addMigrations([migration1to2])
        .build();

    todoDao = database.todoDao;

    return todoDao;
  }

  /*
  *   Sample migration code if needed later
  * */
  final migration1to2 = Migration(1, 2, (database) async {
    await database.execute('ALTER TABLE Job ADD COLUMN column1 TEXT');
    await database.execute('ALTER TABLE Customer ADD COLUMN column2 INTEGER');
  });
}
