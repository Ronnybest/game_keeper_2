// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_games_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGamesModel _$SearchGamesModelFromJson(Map<String, dynamic> json) =>
    SearchGamesModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      userPlatforms: json['user_platforms'] as bool?,
    );

Map<String, dynamic> _$SearchGamesModelToJson(SearchGamesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
      'user_platforms': instance.userPlatforms,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      playtime: json['playtime'] as int?,
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => Platform.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      released: json['released'] == null
          ? null
          : DateTime.parse(json['released'] as String),
      tba: json['tba'] as bool?,
      backgroundImage: json['background_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: json['rating_top'] as int?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsCount: json['ratings_count'] as int?,
      reviewsTextCount: json['reviews_text_count'] as int?,
      added: json['added'] as int?,
      addedByStatus: json['added_by_status'] == null
          ? null
          : AddedByStatus.fromJson(
              json['added_by_status'] as Map<String, dynamic>),
      metacritic: json['metacritic'] as int?,
      suggestionsCount: json['suggestions_count'] as int?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      id: json['id'] as int?,
      score: json['score'],
      clip: json['clip'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      esrbRating: json['esrb_rating'] == null
          ? null
          : EsrbRating.fromJson(json['esrb_rating'] as Map<String, dynamic>),
      userGame: json['user_game'],
      reviewsCount: json['reviews_count'] as int?,
      saturatedColor: json['saturated_color'] as String?,
      dominantColor: json['dominant_color'] as String?,
      shortScreenshots: (json['short_screenshots'] as List<dynamic>?)
          ?.map((e) => ShortScreenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentPlatforms: (json['parent_platforms'] as List<dynamic>?)
          ?.map((e) => Platform.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityRating: json['community_rating'] as int?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'playtime': instance.playtime,
      'platforms': instance.platforms,
      'stores': instance.stores,
      'released': instance.released?.toIso8601String(),
      'tba': instance.tba,
      'background_image': instance.backgroundImage,
      'rating': instance.rating,
      'rating_top': instance.ratingTop,
      'ratings': instance.ratings,
      'ratings_count': instance.ratingsCount,
      'reviews_text_count': instance.reviewsTextCount,
      'added': instance.added,
      'added_by_status': instance.addedByStatus,
      'metacritic': instance.metacritic,
      'suggestions_count': instance.suggestionsCount,
      'updated': instance.updated?.toIso8601String(),
      'id': instance.id,
      'score': instance.score,
      'clip': instance.clip,
      'tags': instance.tags,
      'esrb_rating': instance.esrbRating,
      'user_game': instance.userGame,
      'reviews_count': instance.reviewsCount,
      'saturated_color': instance.saturatedColor,
      'dominant_color': instance.dominantColor,
      'short_screenshots': instance.shortScreenshots,
      'parent_platforms': instance.parentPlatforms,
      'genres': instance.genres,
      'community_rating': instance.communityRating,
    };

AddedByStatus _$AddedByStatusFromJson(Map<String, dynamic> json) =>
    AddedByStatus(
      yet: json['yet'] as int?,
      owned: json['owned'] as int?,
      beaten: json['beaten'] as int?,
      toplay: json['toplay'] as int?,
      dropped: json['dropped'] as int?,
      playing: json['playing'] as int?,
    );

Map<String, dynamic> _$AddedByStatusToJson(AddedByStatus instance) =>
    <String, dynamic>{
      'yet': instance.yet,
      'owned': instance.owned,
      'beaten': instance.beaten,
      'toplay': instance.toplay,
      'dropped': instance.dropped,
      'playing': instance.playing,
    };

EsrbRating _$EsrbRatingFromJson(Map<String, dynamic> json) => EsrbRating(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      nameEn: json['name_en'] as String?,
      nameRu: json['name_ru'] as String?,
    );

Map<String, dynamic> _$EsrbRatingToJson(EsrbRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'name_en': instance.nameEn,
      'name_ru': instance.nameRu,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

Platform _$PlatformFromJson(Map<String, dynamic> json) => Platform(
      platform: json['platform'] == null
          ? null
          : Genre.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformToJson(Platform instance) => <String, dynamic>{
      'platform': instance.platform,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      id: json['id'] as int?,
      title: json['title'] as String?,
      count: json['count'] as int?,
      percent: (json['percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };

ShortScreenshot _$ShortScreenshotFromJson(Map<String, dynamic> json) =>
    ShortScreenshot(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ShortScreenshotToJson(ShortScreenshot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      store: json['store'] == null
          ? null
          : Genre.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'store': instance.store,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      language: json['language'] as String?,
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'language': instance.language,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
    };
