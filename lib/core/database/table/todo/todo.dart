import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'todo.g.dart';

@JsonSerializable()
@entity
class Todo {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String? title;
  final String? startDate;
  final String? endDate;
  final String? status;

  Todo(
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.status,
  );
}
