// To parse this JSON data, do
//
//     final gamesListModel = gamesListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'games_list_model.g.dart';

GamesListModel gamesListModelFromJson(String str) => GamesListModel.fromJson(json.decode(str));

String gamesListModelToJson(GamesListModel data) => json.encode(data.toJson());

@JsonSerializable()
class GamesListModel {
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "next")
    final String? next;
    @JsonKey(name: "previous")
    final dynamic previous;
    @JsonKey(name: "results")
    final List<GameResult>? results;
    @JsonKey(name: "seo_title")
    final String? seoTitle;
    @JsonKey(name: "seo_description")
    final String? seoDescription;
    @JsonKey(name: "seo_keywords")
    final String? seoKeywords;
    @JsonKey(name: "seo_h1")
    final String? seoH1;
    @JsonKey(name: "noindex")
    final bool? noindex;
    @JsonKey(name: "nofollow")
    final bool? nofollow;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "filters")
    final Filters? filters;
    @JsonKey(name: "nofollow_collections")
    final List<String>? nofollowCollections;

    GamesListModel({
        this.count,
        this.next,
        this.previous,
        this.results,
        this.seoTitle,
        this.seoDescription,
        this.seoKeywords,
        this.seoH1,
        this.noindex,
        this.nofollow,
        this.description,
        this.filters,
        this.nofollowCollections,
    });

    factory GamesListModel.fromJson(Map<String, dynamic> json) => _$GamesListModelFromJson(json);

    Map<String, dynamic> toJson() => _$GamesListModelToJson(this);
}

@JsonSerializable()
class Filters {
    @JsonKey(name: "years")
    final List<FiltersYear>? years;

    Filters({
        this.years,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class FiltersYear {
    @JsonKey(name: "from")
    final int? from;
    @JsonKey(name: "to")
    final int? to;
    @JsonKey(name: "filter")
    final String? filter;
    @JsonKey(name: "decade")
    final int? decade;
    @JsonKey(name: "years")
    final List<YearYear>? years;
    @JsonKey(name: "nofollow")
    final bool? nofollow;
    @JsonKey(name: "count")
    final int? count;

    FiltersYear({
        this.from,
        this.to,
        this.filter,
        this.decade,
        this.years,
        this.nofollow,
        this.count,
    });

    factory FiltersYear.fromJson(Map<String, dynamic> json) => _$FiltersYearFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersYearToJson(this);
}

@JsonSerializable()
class YearYear {
    @JsonKey(name: "year")
    final int? year;
    @JsonKey(name: "count")
    final int? count;
    @JsonKey(name: "nofollow")
    final bool? nofollow;

    YearYear({
        this.year,
        this.count,
        this.nofollow,
    });

    factory YearYear.fromJson(Map<String, dynamic> json) => _$YearYearFromJson(json);

    Map<String, dynamic> toJson() => _$YearYearToJson(this);
}

@JsonSerializable()
class GameResult {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "slug")
    final String? slug;
    @JsonKey(name: "name")
    final String? name;
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
    @JsonKey(name: "playtime")
    final int? playtime;
    @JsonKey(name: "suggestions_count")
    final int? suggestionsCount;
    @JsonKey(name: "updated")
    final DateTime? updated;
    @JsonKey(name: "user_game")
    final dynamic userGame;
    @JsonKey(name: "reviews_count")
    final int? reviewsCount;
    @JsonKey(name: "saturated_color")
    final String? saturatedColor;
    @JsonKey(name: "dominant_color")
    final String? dominantColor;
    @JsonKey(name: "platforms")
    final List<PlatformElement>? platforms;
    @JsonKey(name: "parent_platforms")
    final List<ParentPlatform>? parentPlatforms;
    @JsonKey(name: "genres")
    final List<Genre>? genres;
    @JsonKey(name: "stores")
    final List<Store>? stores;
    @JsonKey(name: "clip")
    final dynamic clip;
    @JsonKey(name: "tags")
    final List<Genre>? tags;
    @JsonKey(name: "esrb_rating")
    final EsrbRating? esrbRating;
    @JsonKey(name: "short_screenshots")
    final List<ShortScreenshot>? shortScreenshots;

    GameResult({
        this.id,
        this.slug,
        this.name,
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
        this.playtime,
        this.suggestionsCount,
        this.updated,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.platforms,
        this.parentPlatforms,
        this.genres,
        this.stores,
        this.clip,
        this.tags,
        this.esrbRating,
        this.shortScreenshots,
    });

    factory GameResult.fromJson(Map<String, dynamic> json) => _$GameResultFromJson(json);

    Map<String, dynamic> toJson() => _$GameResultToJson(this);
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

    EsrbRating({
        this.id,
        this.name,
        this.slug,
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
    @JsonKey(name: "games_count")
    final int? gamesCount;
    @JsonKey(name: "image_background")
    final String? imageBackground;
    @JsonKey(name: "domain")
    final String? domain;
    @JsonKey(name: "language")
    final String? language;

    Genre({
        this.id,
        this.name,
        this.slug,
        this.gamesCount,
        this.imageBackground,
        this.domain,
        this.language,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

    Map<String, dynamic> toJson() => _$GenreToJson(this);
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
    @JsonKey(name: "requirements_en")
    final RequirementsEn? requirementsEn;
    @JsonKey(name: "requirements_ru")
    final dynamic requirementsRu;

    PlatformElement({
        this.platform,
        this.releasedAt,
        this.requirementsEn,
        this.requirementsRu,
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
    final int? yearStart;
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
class RequirementsEn {
    @JsonKey(name: "minimum")
    final String? minimum;
    @JsonKey(name: "recommended")
    final String? recommended;

    RequirementsEn({
        this.minimum,
        this.recommended,
    });

    factory RequirementsEn.fromJson(Map<String, dynamic> json) => _$RequirementsEnFromJson(json);

    Map<String, dynamic> toJson() => _$RequirementsEnToJson(this);
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
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "store")
    final Genre? store;

    Store({
        this.id,
        this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

    Map<String, dynamic> toJson() => _$StoreToJson(this);
}
