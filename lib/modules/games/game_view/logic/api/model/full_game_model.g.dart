// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullGameModel _$FullGameModelFromJson(Map<String, dynamic> json) =>
    FullGameModel(
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      nameOriginal: json['name_original'] as String?,
      description: json['description'] as String?,
      metacritic: json['metacritic'] as int?,
      metacriticPlatforms: json['metacritic_platforms'] as List<dynamic>?,
      released: json['released'] == null
          ? null
          : DateTime.parse(json['released'] as String),
      tba: json['tba'] as bool?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      backgroundImage: json['background_image'] as String?,
      backgroundImageAdditional: json['background_image_additional'] as String?,
      website: json['website'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: json['rating_top'] as int?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      reactions: (json['reactions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      added: json['added'] as int?,
      addedByStatus: json['added_by_status'] == null
          ? null
          : AddedByStatus.fromJson(
              json['added_by_status'] as Map<String, dynamic>),
      playtime: json['playtime'] as int?,
      screenshotsCount: json['screenshots_count'] as int?,
      moviesCount: json['movies_count'] as int?,
      creatorsCount: json['creators_count'] as int?,
      achievementsCount: json['achievements_count'] as int?,
      parentAchievementsCount: json['parent_achievements_count'] as int?,
      redditUrl: json['reddit_url'] as String?,
      redditName: json['reddit_name'] as String?,
      redditDescription: json['reddit_description'] as String?,
      redditLogo: json['reddit_logo'] as String?,
      redditCount: json['reddit_count'] as int?,
      twitchCount: json['twitch_count'] as int?,
      youtubeCount: json['youtube_count'] as int?,
      reviewsTextCount: json['reviews_text_count'] as int?,
      ratingsCount: json['ratings_count'] as int?,
      suggestionsCount: json['suggestions_count'] as int?,
      alternativeNames: json['alternative_names'] as List<dynamic>?,
      metacriticUrl: json['metacritic_url'] as String?,
      parentsCount: json['parents_count'] as int?,
      additionsCount: json['additions_count'] as int?,
      gameSeriesCount: json['game_series_count'] as int?,
      userGame: json['user_game'],
      reviewsCount: json['reviews_count'] as int?,
      saturatedColor: json['saturated_color'] as String?,
      dominantColor: json['dominant_color'] as String?,
      parentPlatforms: (json['parent_platforms'] as List<dynamic>?)
          ?.map((e) => ParentPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => PlatformElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      developers: (json['developers'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishers: (json['publishers'] as List<dynamic>?)
          ?.map((e) => Developer.fromJson(e as Map<String, dynamic>))
          .toList(),
      esrbRating: json['esrb_rating'] == null
          ? null
          : EsrbRating.fromJson(json['esrb_rating'] as Map<String, dynamic>),
      clip: json['clip'],
      descriptionRaw: json['description_raw'] as String?,
    );

Map<String, dynamic> _$FullGameModelToJson(FullGameModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'name_original': instance.nameOriginal,
      'description': instance.description,
      'metacritic': instance.metacritic,
      'metacritic_platforms': instance.metacriticPlatforms,
      'released': instance.released?.toIso8601String(),
      'tba': instance.tba,
      'updated': instance.updated?.toIso8601String(),
      'background_image': instance.backgroundImage,
      'background_image_additional': instance.backgroundImageAdditional,
      'website': instance.website,
      'rating': instance.rating,
      'rating_top': instance.ratingTop,
      'ratings': instance.ratings,
      'reactions': instance.reactions,
      'added': instance.added,
      'added_by_status': instance.addedByStatus,
      'playtime': instance.playtime,
      'screenshots_count': instance.screenshotsCount,
      'movies_count': instance.moviesCount,
      'creators_count': instance.creatorsCount,
      'achievements_count': instance.achievementsCount,
      'parent_achievements_count': instance.parentAchievementsCount,
      'reddit_url': instance.redditUrl,
      'reddit_name': instance.redditName,
      'reddit_description': instance.redditDescription,
      'reddit_logo': instance.redditLogo,
      'reddit_count': instance.redditCount,
      'twitch_count': instance.twitchCount,
      'youtube_count': instance.youtubeCount,
      'reviews_text_count': instance.reviewsTextCount,
      'ratings_count': instance.ratingsCount,
      'suggestions_count': instance.suggestionsCount,
      'alternative_names': instance.alternativeNames,
      'metacritic_url': instance.metacriticUrl,
      'parents_count': instance.parentsCount,
      'additions_count': instance.additionsCount,
      'game_series_count': instance.gameSeriesCount,
      'user_game': instance.userGame,
      'reviews_count': instance.reviewsCount,
      'saturated_color': instance.saturatedColor,
      'dominant_color': instance.dominantColor,
      'parent_platforms': instance.parentPlatforms,
      'platforms': instance.platforms,
      'stores': instance.stores,
      'developers': instance.developers,
      'genres': instance.genres,
      'tags': instance.tags,
      'publishers': instance.publishers,
      'esrb_rating': instance.esrbRating,
      'clip': instance.clip,
      'description_raw': instance.descriptionRaw,
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

Developer _$DeveloperFromJson(Map<String, dynamic> json) => Developer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
      domain: json['domain'] as String?,
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$DeveloperToJson(Developer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
      'domain': instance.domain,
      'language': _$LanguageEnumMap[instance.language],
    };

const _$LanguageEnumMap = {
  Language.ENG: 'eng',
};

EsrbRating _$EsrbRatingFromJson(Map<String, dynamic> json) => EsrbRating(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$EsrbRatingToJson(EsrbRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

ParentPlatform _$ParentPlatformFromJson(Map<String, dynamic> json) =>
    ParentPlatform(
      platform: json['platform'] == null
          ? null
          : EsrbRating.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParentPlatformToJson(ParentPlatform instance) =>
    <String, dynamic>{
      'platform': instance.platform,
    };

PlatformElement _$PlatformElementFromJson(Map<String, dynamic> json) =>
    PlatformElement(
      platform: json['platform'] == null
          ? null
          : PlatformPlatform.fromJson(json['platform'] as Map<String, dynamic>),
      releasedAt: json['released_at'] == null
          ? null
          : DateTime.parse(json['released_at'] as String),
      requirements: json['requirements'] == null
          ? null
          : Requirements.fromJson(json['requirements'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformElementToJson(PlatformElement instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'released_at': instance.releasedAt?.toIso8601String(),
      'requirements': instance.requirements,
    };

PlatformPlatform _$PlatformPlatformFromJson(Map<String, dynamic> json) =>
    PlatformPlatform(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'],
      yearEnd: json['year_end'],
      yearStart: json['year_start'],
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
    );

Map<String, dynamic> _$PlatformPlatformToJson(PlatformPlatform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'year_end': instance.yearEnd,
      'year_start': instance.yearStart,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
    };

Requirements _$RequirementsFromJson(Map<String, dynamic> json) =>
    Requirements();

Map<String, dynamic> _$RequirementsToJson(Requirements instance) =>
    <String, dynamic>{};

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

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as int?,
      url: json['url'] as String?,
      store: json['store'] == null
          ? null
          : Developer.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'store': instance.store,
    };
