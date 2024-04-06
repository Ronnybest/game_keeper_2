// To parse this JSON data, do
//
//     final fullGameModel = fullGameModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'full_game_model.g.dart';

FullGameModel fullGameModelFromJson(String str) => FullGameModel.fromJson(json.decode(str));

String fullGameModelToJson(FullGameModel data) => json.encode(data.toJson());

@JsonSerializable()
class FullGameModel {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "name_original")
    final String? nameOriginal;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "metacritic")
    final int? metacritic;
    @JsonKey(name: "metacritic_platforms")
    final List<dynamic>? metacriticPlatforms;
    @JsonKey(name: "released")
    final DateTime? released;
    @JsonKey(name: "tba")
    final bool? tba;
    @JsonKey(name: "updated")
    final DateTime? updated;
    @JsonKey(name: "background_image")
    final String? backgroundImage;
    @JsonKey(name: "background_image_additional")
    final String? backgroundImageAdditional;
    @JsonKey(name: "website")
    final String? website;
    @JsonKey(name: "rating")
    final double? rating;
    @JsonKey(name: "rating_top")
    final int? ratingTop;
    @JsonKey(name: "ratings")
    final List<Rating>? ratings;
    @JsonKey(name: "reactions")
    final Map<String, int>? reactions;
    @JsonKey(name: "added")
    final int? added;
    @JsonKey(name: "added_by_status")
    final AddedByStatus? addedByStatus;
    @JsonKey(name: "playtime")
    final int? playtime;
    @JsonKey(name: "screenshots_count")
    final int? screenshotsCount;
    @JsonKey(name: "movies_count")
    final int? moviesCount;
    @JsonKey(name: "creators_count")
    final int? creatorsCount;
    @JsonKey(name: "achievements_count")
    final int? achievementsCount;
    @JsonKey(name: "parent_achievements_count")
    final int? parentAchievementsCount;
    @JsonKey(name: "reddit_url")
    final String? redditUrl;
    @JsonKey(name: "reddit_name")
    final String? redditName;
    @JsonKey(name: "reddit_description")
    final String? redditDescription;
    @JsonKey(name: "reddit_logo")
    final String? redditLogo;
    @JsonKey(name: "reddit_count")
    final int? redditCount;
    @JsonKey(name: "twitch_count")
    final int? twitchCount;
    @JsonKey(name: "youtube_count")
    final int? youtubeCount;
    @JsonKey(name: "reviews_text_count")
    final int? reviewsTextCount;
    @JsonKey(name: "ratings_count")
    final int? ratingsCount;
    @JsonKey(name: "suggestions_count")
    final int? suggestionsCount;
    @JsonKey(name: "alternative_names")
    final List<dynamic>? alternativeNames;
    @JsonKey(name: "metacritic_url")
    final String? metacriticUrl;
    @JsonKey(name: "parents_count")
    final int? parentsCount;
    @JsonKey(name: "additions_count")
    final int? additionsCount;
    @JsonKey(name: "game_series_count")
    final int? gameSeriesCount;
    @JsonKey(name: "user_game")
    final dynamic userGame;
    @JsonKey(name: "reviews_count")
    final int? reviewsCount;
    @JsonKey(name: "saturated_color")
    final String? saturatedColor;
    @JsonKey(name: "dominant_color")
    final String? dominantColor;
    @JsonKey(name: "parent_platforms")
    final List<ParentPlatform>? parentPlatforms;
    @JsonKey(name: "platforms")
    final List<PlatformElement>? platforms;
    @JsonKey(name: "stores")
    final List<Store>? stores;
    @JsonKey(name: "developers")
    final List<Developer>? developers;
    @JsonKey(name: "genres")
    final List<Developer>? genres;
    @JsonKey(name: "tags")
    final List<Developer>? tags;
    @JsonKey(name: "publishers")
    final List<Developer>? publishers;
    @JsonKey(name: "esrb_rating")
    final EsrbRating? esrbRating;
    @JsonKey(name: "clip")
    final dynamic clip;
    @JsonKey(name: "description_raw")
    final String? descriptionRaw;

    FullGameModel({
        this.id,
        this.slug,
        this.name,
        this.nameOriginal,
        this.description,
        this.metacritic,
        this.metacriticPlatforms,
        this.released,
        this.tba,
        this.updated,
        this.backgroundImage,
        this.backgroundImageAdditional,
        this.website,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.reactions,
        this.added,
        this.addedByStatus,
        this.playtime,
        this.screenshotsCount,
        this.moviesCount,
        this.creatorsCount,
        this.achievementsCount,
        this.parentAchievementsCount,
        this.redditUrl,
        this.redditName,
        this.redditDescription,
        this.redditLogo,
        this.redditCount,
        this.twitchCount,
        this.youtubeCount,
        this.reviewsTextCount,
        this.ratingsCount,
        this.suggestionsCount,
        this.alternativeNames,
        this.metacriticUrl,
        this.parentsCount,
        this.additionsCount,
        this.gameSeriesCount,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.parentPlatforms,
        this.platforms,
        this.stores,
        this.developers,
        this.genres,
        this.tags,
        this.publishers,
        this.esrbRating,
        this.clip,
        this.descriptionRaw,
    });

    factory FullGameModel.fromJson(Map<String, dynamic> json) => _$FullGameModelFromJson(json);

    Map<String, dynamic> toJson() => _$FullGameModelToJson(this);
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
class Developer {
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
    @JsonKey(name: "domain")
    final String? domain;
    @JsonKey(name: "language")
    final Language? language;

    Developer({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.domain,
        this.language,
    });

    factory Developer.fromJson(Map<String, dynamic> json) => _$DeveloperFromJson(json);

    Map<String, dynamic> toJson() => _$DeveloperToJson(this);
}

enum Language {
    @JsonValue("eng")
    ENG
}

final languageValues = EnumValues({
    "eng": Language.ENG
});

@JsonSerializable()
class EsrbRating {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "slug")
    final String? slug;

    EsrbRating({
        this.id,
        this.name,
        this.slug,
    });

    factory EsrbRating.fromJson(Map<String, dynamic> json) => _$EsrbRatingFromJson(json);

    Map<String, dynamic> toJson() => _$EsrbRatingToJson(this);
}

@JsonSerializable()
class ParentPlatform {
    @JsonKey(name: "platform")
    final EsrbRating? platform;

    ParentPlatform({
        this.platform,
    });

    factory ParentPlatform.fromJson(Map<String, dynamic> json) => _$ParentPlatformFromJson(json);

    Map<String, dynamic> toJson() => _$ParentPlatformToJson(this);
}

@JsonSerializable()
class PlatformElement {
    @JsonKey(name: "platform")
    final PlatformPlatform? platform;
    @JsonKey(name: "released_at")
    final DateTime? releasedAt;
    @JsonKey(name: "requirements")
    final Requirements? requirements;

    PlatformElement({
        this.platform,
        this.releasedAt,
        this.requirements,
    });

    factory PlatformElement.fromJson(Map<String, dynamic> json) => _$PlatformElementFromJson(json);

    Map<String, dynamic> toJson() => _$PlatformElementToJson(this);
}

@JsonSerializable()
class PlatformPlatform {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "image")
    final dynamic image;
    @JsonKey(name: "year_end")
    final dynamic yearEnd;
    @JsonKey(name: "year_start")
    final dynamic yearStart;
    @JsonKey(name: "games_count")
    final int? gamesCount;
    @JsonKey(name: "image_background")
    final String? imageBackground;

    PlatformPlatform({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.yearEnd,
        this.yearStart,
        this.gamesCount,
        this.imageBackground,
    });

    factory PlatformPlatform.fromJson(Map<String, dynamic> json) => _$PlatformPlatformFromJson(json);

    Map<String, dynamic> toJson() => _$PlatformPlatformToJson(this);
}

@JsonSerializable()
class Requirements {
    Requirements();

    factory Requirements.fromJson(Map<String, dynamic> json) => _$RequirementsFromJson(json);

    Map<String, dynamic> toJson() => _$RequirementsToJson(this);
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
class Store {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "url")
    final String? url;
    @JsonKey(name: "store")
    final Developer? store;

    Store({
        this.id,
        this.url,
        this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

    Map<String, dynamic> toJson() => _$StoreToJson(this);
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
