// To parse this JSON data, do
//
//     final gameAchievementsModel = gameAchievementsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'game_achievements_model.g.dart';

GameAchievementsModel gameAchievementsModelFromJson(String str) => GameAchievementsModel.fromJson(json.decode(str));

String gameAchievementsModelToJson(GameAchievementsModel data) => json.encode(data.toJson());

@JsonSerializable()
class GameAchievementsModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final String? next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<Result>? results;

    GameAchievementsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory GameAchievementsModel.fromJson(Map<String, dynamic> json) => _$GameAchievementsModelFromJson(json);

    Map<String, dynamic> toJson() => _$GameAchievementsModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "percent")
    final String? percent;

    Result({
        this.id,
        this.name,
        this.description,
        this.image,
        this.percent,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
