// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticlesDao? _articlesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Articles` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT, `datePublished` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ArticlesDao get articlesDao {
    return _articlesDaoInstance ??= _$ArticlesDao(database, changeListener);
  }
}

class _$ArticlesDao extends ArticlesDao {
  _$ArticlesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _articlesInsertionAdapter = InsertionAdapter(
            database,
            'Articles',
            (Articles item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'datePublished': item.datePublished
                }),
        _articlesUpdateAdapter = UpdateAdapter(
            database,
            'Articles',
            ['id'],
            (Articles item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'datePublished': item.datePublished
                }),
        _articlesDeletionAdapter = DeletionAdapter(
            database,
            'Articles',
            ['id'],
            (Articles item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'datePublished': item.datePublished
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Articles> _articlesInsertionAdapter;

  final UpdateAdapter<Articles> _articlesUpdateAdapter;

  final DeletionAdapter<Articles> _articlesDeletionAdapter;

  @override
  Future<List<Articles>> getAllArticles() async {
    return _queryAdapter.queryList('SELECT * FROM Articles',
        mapper: (Map<String, Object?> row) => Articles(row['id'] as int?,
            row['title'] as String?, row['datePublished'] as String?));
  }

  @override
  Future<void> deleteAllArticles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Articles');
  }

  @override
  Future<int> insertArticle(Articles item) {
    return _articlesInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateArticle(Articles item) {
    return _articlesUpdateAdapter.updateAndReturnChangedRows(
        item, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateMultipleArticles(List<Articles> items) {
    return _articlesUpdateAdapter.updateListAndReturnChangedRows(
        items, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteArticle(Articles todo) async {
    await _articlesDeletionAdapter.delete(todo);
  }
}
