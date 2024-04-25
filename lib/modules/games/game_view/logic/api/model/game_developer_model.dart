// To parse this JSON data, do
//
//     final gameDeveloperModel = gameDeveloperModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'game_developer_model.g.dart';

GameDeveloperModel gameDeveloperModelFromJson(String str) => GameDeveloperModel.fromJson(json.decode(str));

String gameDeveloperModelToJson(GameDeveloperModel data) => json.encode(data.toJson());

@JsonSerializable()
class GameDeveloperModel {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "games_count")
    final int? gamesCount;
    @JsonKey(name: "image_background")
    final String? imageBackground;
    @JsonKey(name: "description")
    final String? description;

    GameDeveloperModel({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.description,
    });

    factory GameDeveloperModel.fromJson(Map<String, dynamic> json) => _$GameDeveloperModelFromJson(json);

    Map<String, dynamic> toJson() => _$GameDeveloperModelToJson(this);
}
