import 'package:json_annotation/json_annotation.dart';
import 'package:keymo_flutter/model/keyword.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final List<Keyword> keywordList;

  User({required this.keywordList});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}