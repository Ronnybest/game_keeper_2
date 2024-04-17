// To parse this JSON data, do
//
//     final gameRedditCommentsModel = gameRedditCommentsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'game_reddit_comments_model.g.dart';

GameRedditCommentsModel gameRedditCommentsModelFromJson(String str) => GameRedditCommentsModel.fromJson(json.decode(str));

String gameRedditCommentsModelToJson(GameRedditCommentsModel data) => json.encode(data.toJson());

@JsonSerializable()
class GameRedditCommentsModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final String? next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<Result>? results;

    GameRedditCommentsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory GameRedditCommentsModel.fromJson(Map<String, dynamic> json) => _$GameRedditCommentsModelFromJson(json);

    Map<String, dynamic> toJson() => _$GameRedditCommentsModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "text")
    final String? text;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "url")
    final String? url;
    @JsonKey(name: "username")
    final String? username;
    @JsonKey(name: "username_url")
    final String? usernameUrl;
    @JsonKey(name: "created")
    final DateTime? created;

    Result({
        this.id,
        this.name,
        this.text,
        this.image,
        this.url,
        this.username,
        this.usernameUrl,
        this.created,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
