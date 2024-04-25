// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_firestore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFirestore _$UserFirestoreFromJson(Map<String, dynamic> json) =>
    UserFirestore(
      email: json['email'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      uid: json['uid'] as String?,
      bookMarkedGamesId: (json['bookMarkedGamesId'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      currentPlayingGamesId: (json['currentPlayingGamesId'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      firendsId: (json['firendsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hidedGamesId: (json['hidedGamesId'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$UserFirestoreToJson(UserFirestore instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'uid': instance.uid,
      'bookMarkedGamesId': instance.bookMarkedGamesId,
      'currentPlayingGamesId': instance.currentPlayingGamesId,
      'firendsId': instance.firendsId,
      'hidedGamesId': instance.hidedGamesId,
    };
