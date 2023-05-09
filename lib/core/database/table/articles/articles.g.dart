// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      json['id'] as int?,
      json['title'] as String?,
      json['datePublished'] as String?,
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'datePublished': instance.datePublished,
    };
