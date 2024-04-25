// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'where_to_buy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhereToBuyModel _$WhereToBuyModelFromJson(Map<String, dynamic> json) =>
    WhereToBuyModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WhereToBuyModelToJson(WhereToBuyModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: (json['id'] as num?)?.toInt(),
      gameId: (json['game_id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'store_id': instance.storeId,
      'url': instance.url,
    };
