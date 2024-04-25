// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_games_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeveloperGamesListModel _$DeveloperGamesListModelFromJson(
        Map<String, dynamic> json) =>
    DeveloperGamesListModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      userPlatforms: json['user_platforms'] as bool?,
    );

Map<String, dynamic> _$DeveloperGamesListModelToJson(
        DeveloperGamesListModel instance) =>
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
      playtime: (json['playtime'] as num?)?.toInt(),
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
      rating: (json['rating'] as num?)?.toInt(),
      ratingTop: (json['rating_top'] as num?)?.toInt(),
      ratings: json['ratings'] as List<dynamic>?,
      ratingsCount: (json['ratings_count'] as num?)?.toInt(),
      reviewsTextCount: (json['reviews_text_count'] as num?)?.toInt(),
      added: (json['added'] as num?)?.toInt(),
      addedByStatus: json['added_by_status'],
      metacritic: json['metacritic'],
      suggestionsCount: (json['suggestions_count'] as num?)?.toInt(),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      id: (json['id'] as num?)?.toInt(),
      score: json['score'],
      clip: json['clip'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      esrbRating: json['esrb_rating'] == null
          ? null
          : EsrbRating.fromJson(json['esrb_rating'] as Map<String, dynamic>),
      userGame: json['user_game'],
      reviewsCount: (json['reviews_count'] as num?)?.toInt(),
      communityRating: (json['community_rating'] as num?)?.toInt(),
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
      'community_rating': instance.communityRating,
      'saturated_color': instance.saturatedColor,
      'dominant_color': instance.dominantColor,
      'short_screenshots': instance.shortScreenshots,
      'parent_platforms': instance.parentPlatforms,
      'genres': instance.genres,
    };

EsrbRating _$EsrbRatingFromJson(Map<String, dynamic> json) => EsrbRating(
      id: (json['id'] as num?)?.toInt(),
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
      id: (json['id'] as num?)?.toInt(),
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

ShortScreenshot _$ShortScreenshotFromJson(Map<String, dynamic> json) =>
    ShortScreenshot(
      id: (json['id'] as num?)?.toInt(),
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
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      language: json['language'] as String?,
      gamesCount: (json['games_count'] as num?)?.toInt(),
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
