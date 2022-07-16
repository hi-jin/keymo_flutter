import 'package:json_annotation/json_annotation.dart';

part 'keyword.g.dart';

@JsonSerializable()
class Keyword {

  final String title;
  final List<String> wordList;
  final DateTime pubDate;

  Keyword({required this.title, required this.wordList, required this.pubDate});

  factory Keyword.fromJson(Map<String, dynamic> json) => _$KeywordFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordToJson(this);
}