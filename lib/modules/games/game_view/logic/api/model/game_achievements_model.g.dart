// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_achievements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameAchievementsModel _$GameAchievementsModelFromJson(
        Map<String, dynamic> json) =>
    GameAchievementsModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameAchievementsModelToJson(
        GameAchievementsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'percent': instance.percent,
    };
