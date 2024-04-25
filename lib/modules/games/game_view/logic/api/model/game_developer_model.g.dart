// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_developer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDeveloperModel _$GameDeveloperModelFromJson(Map<String, dynamic> json) =>
    GameDeveloperModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      gamesCount: (json['games_count'] as num?)?.toInt(),
      imageBackground: json['image_background'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GameDeveloperModelToJson(GameDeveloperModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
      'description': instance.description,
    };
