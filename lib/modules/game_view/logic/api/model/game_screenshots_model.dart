// To parse this JSON data, do
//
//     final gameScreenshotsModel = gameScreenshotsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'game_screenshots_model.g.dart';

GameScreenshotsModel gameScreenshotsModelFromJson(String str) => GameScreenshotsModel.fromJson(json.decode(str));

String gameScreenshotsModelToJson(GameScreenshotsModel data) => json.encode(data.toJson());

@JsonSerializable()
class GameScreenshotsModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final dynamic next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<Result>? results;

    GameScreenshotsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory GameScreenshotsModel.fromJson(Map<String, dynamic> json) => _$GameScreenshotsModelFromJson(json);

    Map<String, dynamic> toJson() => _$GameScreenshotsModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "width")
    final int? width;
    @JsonKey(name: "height")
    final int? height;
    @JsonKey(name: "is_deleted")
    final bool? isDeleted;

    Result({
        this.id,
        this.image,
        this.width,
        this.height,
        this.isDeleted,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
