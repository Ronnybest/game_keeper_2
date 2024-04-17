// To parse this JSON data, do
//
//     final searchGamesModel = searchGamesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'search_games_model.g.dart';

SearchGamesModel searchGamesModelFromJson(String str) => SearchGamesModel.fromJson(json.decode(str));

String searchGamesModelToJson(SearchGamesModel data) => json.encode(data.toJson());

@JsonSerializable()
class SearchGamesModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final String? next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<Result>? results;
    @JsonKey(name: "user_platforms")
    final bool? userPlatforms;

    SearchGamesModel({
        this.count,
        this.next,
        this.previous,
        this.results,
        this.userPlatforms,
    });

    factory SearchGamesModel.fromJson(Map<String, dynamic> json) => _$SearchGamesModelFromJson(json);

    Map<String, dynamic> toJson() => _$SearchGamesModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "playtime")
    final int? playtime;
    @JsonKey(name: "platforms")
    final List<Platform>? platforms;
    @JsonKey(name: "stores")
    final List<Store>? stores;
    @JsonKey(name: "released")
    final DateTime? released;
    @JsonKey(name: "tba")
    final bool? tba;
    @JsonKey(name: "background_image")
    final String? backgroundImage;
    @JsonKey(name: "rating")
    final double? rating;
    @JsonKey(name: "rating_top")
    final int? ratingTop;
    @JsonKey(name: "ratings")
    final List<Rating>? ratings;
    @JsonKey(name: "ratings_count")
    final int? ratingsCount;
    @JsonKey(name: "reviews_text_count")
    final int? reviewsTextCount;
    @JsonKey(name: "added")
    final int? added;
    @JsonKey(name: "added_by_status")
    final AddedByStatus? addedByStatus;
    @JsonKey(name: "metacritic")
    final int? metacritic;
    @JsonKey(name: "suggestions_count")
    final int? suggestionsCount;
    @JsonKey(name: "updated")
    final DateTime? updated;
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "score")
    final dynamic score;
    @JsonKey(name: "clip")
    final dynamic clip;
    @JsonKey(name: "tags")
    final List<Tag>? tags;
    @JsonKey(name: "esrb_rating")
    final EsrbRating? esrbRating;
    @JsonKey(name: "user_game")
    final dynamic userGame;
    @JsonKey(name: "reviews_count")
    final int? reviewsCount;
    @JsonKey(name: "saturated_color")
    final String? saturatedColor;
    @JsonKey(name: "dominant_color")
    final String? dominantColor;
    @JsonKey(name: "short_screenshots")
    final List<ShortScreenshot>? shortScreenshots;
    @JsonKey(name: "parent_platforms")
    final List<Platform>? parentPlatforms;
    @JsonKey(name: "genres")
    final List<Genre>? genres;
    @JsonKey(name: "community_rating")
    final int? communityRating;

    Result({
        this.slug,
        this.name,
        this.playtime,
        this.platforms,
        this.stores,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.suggestionsCount,
        this.updated,
        this.id,
        this.score,
        this.clip,
        this.tags,
        this.esrbRating,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.shortScreenshots,
        this.parentPlatforms,
        this.genres,
        this.communityRating,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class AddedByStatus {
    @JsonKey(name: "yet")
    final int? yet;
    @JsonKey(name: "owned")
    final int? owned;
    @JsonKey(name: "beaten")
    final int? beaten;
    @JsonKey(name: "toplay")
    final int? toplay;
    @JsonKey(name: "dropped")
    final int? dropped;
    @JsonKey(name: "playing")
    final int? playing;

    AddedByStatus({
        this.yet,
        this.owned,
        this.beaten,
        this.toplay,
        this.dropped,
        this.playing,
    });

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => _$AddedByStatusFromJson(json);

    Map<String, dynamic> toJson() => _$AddedByStatusToJson(this);
}

@JsonSerializable()
class EsrbRating {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "name_en")
    final String? nameEn;
    @JsonKey(name: "name_ru")
    final String? nameRu;

    EsrbRating({
        this.id,
        this.name,
        this.slug,
        this.nameEn,
        this.nameRu,
    });

    factory EsrbRating.fromJson(Map<String, dynamic> json) => _$EsrbRatingFromJson(json);

    Map<String, dynamic> toJson() => _$EsrbRatingToJson(this);
}

@JsonSerializable()
class Genre {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "slug")
    final String? slug;

    Genre({
        this.id,
        this.name,
        this.slug,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

    Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Platform {
    @JsonKey(name: "platform")
    final Genre? platform;

    Platform({
        this.platform,
    });

    factory Platform.fromJson(Map<String, dynamic> json) => _$PlatformFromJson(json);

    Map<String, dynamic> toJson() => _$PlatformToJson(this);
}

@JsonSerializable()
class Rating {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "percent")
    final double? percent;

    Rating({
        this.id,
        this.title,
        this.count,
        this.percent,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

    Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class ShortScreenshot {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "image")
    final String? image;

    ShortScreenshot({
        this.id,
        this.image,
    });

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => _$ShortScreenshotFromJson(json);

    Map<String, dynamic> toJson() => _$ShortScreenshotToJson(this);
}

@JsonSerializable()
class Store {
    @JsonKey(name: "store")
    final Genre? store;

    Store({
        this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

    Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class Tag {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "language")
    final String? language;
    @JsonKey(name: "games_count")
    final int? gamesCount;
    @JsonKey(name: "image_background")
    final String? imageBackground;

    Tag({
        this.id,
        this.name,
        this.slug,
        this.language,
        this.gamesCount,
        this.imageBackground,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

    Map<String, dynamic> toJson() => _$TagToJson(this);
}
