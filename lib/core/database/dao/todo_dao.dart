import 'package:floor/floor.dart';
import 'package:sicpa_news/core/database/table/todo/todo.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM Todo')
  Future<List<Todo>> getAllTodo();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTodo(Todo item);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateTodo(Todo item);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateMultipleTodo(List<Todo> items);

  @delete
  Future<void> deleteTodo(Todo todo);

  @Query('DELETE FROM Todo')
  Future<void> deleteAllTodo();
}
