// To parse this JSON data, do
//
//     final whereToBuyModel = whereToBuyModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'where_to_buy_model.g.dart';

WhereToBuyModel whereToBuyModelFromJson(String str) => WhereToBuyModel.fromJson(json.decode(str));

String whereToBuyModelToJson(WhereToBuyModel data) => json.encode(data.toJson());

@JsonSerializable()
class WhereToBuyModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final dynamic next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<Result>? results;

    WhereToBuyModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory WhereToBuyModel.fromJson(Map<String, dynamic> json) => _$WhereToBuyModelFromJson(json);

    Map<String, dynamic> toJson() => _$WhereToBuyModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "game_id")
    final int? gameId;
    @JsonKey(name: "store_id")
    final int? storeId;
    @JsonKey(name: "url")
    final String? url;

    Result({
        this.id,
        this.gameId,
        this.storeId,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
