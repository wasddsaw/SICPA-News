import 'package:json_annotation/json_annotation.dart';
import 'package:floor/floor.dart';

part 'articles.g.dart';

@JsonSerializable()
@entity
class Articles {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String? title;
  final String? datePublished;

  Articles(
    this.id,
    this.title,
    this.datePublished,
  );
}
