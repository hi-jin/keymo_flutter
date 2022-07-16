// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Keyword _$KeywordFromJson(Map<String, dynamic> json) => Keyword(
      title: json['title'] as String,
      wordList:
          (json['wordList'] as List<dynamic>).map((e) => e as String).toList(),
      pubDate: DateTime.parse(json['pubDate'] as String),
    );

Map<String, dynamic> _$KeywordToJson(Keyword instance) => <String, dynamic>{
      'title': instance.title,
      'wordList': instance.wordList,
      'pubDate': instance.pubDate.toIso8601String(),
    };
