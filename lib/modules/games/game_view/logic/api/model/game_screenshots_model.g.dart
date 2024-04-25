// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_screenshots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameScreenshotsModel _$GameScreenshotsModelFromJson(
        Map<String, dynamic> json) =>
    GameScreenshotsModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameScreenshotsModelToJson(
        GameScreenshotsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      isDeleted: json['is_deleted'] as bool?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'width': instance.width,
      'height': instance.height,
      'is_deleted': instance.isDeleted,
    };
