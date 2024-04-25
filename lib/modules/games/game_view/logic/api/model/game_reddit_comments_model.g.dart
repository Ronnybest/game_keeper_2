// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_reddit_comments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameRedditCommentsModel _$GameRedditCommentsModelFromJson(
        Map<String, dynamic> json) =>
    GameRedditCommentsModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameRedditCommentsModelToJson(
        GameRedditCommentsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
      username: json['username'] as String?,
      usernameUrl: json['username_url'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'image': instance.image,
      'url': instance.url,
      'username': instance.username,
      'username_url': instance.usernameUrl,
      'created': instance.created?.toIso8601String(),
    };
