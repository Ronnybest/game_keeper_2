// To parse this JSON data, do
//
//     final userFirestore = userFirestoreFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_firestore.g.dart';

UserFirestore userFirestoreFromJson(String str) => UserFirestore.fromJson(json.decode(str));

String userFirestoreToJson(UserFirestore data) => json.encode(data.toJson());

@JsonSerializable()
class UserFirestore {
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "photoUrl")
    final String? photoUrl;
    @JsonKey(name: "uid")
    final String? uid;
    @JsonKey(name: "bookMarkedGamesId")
    final List<int>? bookMarkedGamesId;
    @JsonKey(name: "currentPlayingGamesId")
    final List<int>? currentPlayingGamesId;
    @JsonKey(name: "firendsId")
    final List<String>? firendsId;
    @JsonKey(name: "hidedGamesId")
    final List<int>? hidedGamesId;

    UserFirestore({
        this.email,
        this.name,
        this.photoUrl,
        this.uid,
        this.bookMarkedGamesId,
        this.currentPlayingGamesId,
        this.firendsId,
        this.hidedGamesId,
    });

    UserFirestore copyWith({
        String? email,
        String? name,
        String? photoUrl,
        String? uid,
        List<int>? bookMarkedGamesId,
        List<int>? currentPlayingGamesId,
        List<String>? firendsId,
        List<int>? hidedGamesId,
    }) => 
        UserFirestore(
            email: email ?? this.email,
            name: name ?? this.name,
            photoUrl: photoUrl ?? this.photoUrl,
            uid: uid ?? this.uid,
            bookMarkedGamesId: bookMarkedGamesId ?? this.bookMarkedGamesId,
            currentPlayingGamesId: currentPlayingGamesId ?? this.currentPlayingGamesId,
            firendsId: firendsId ?? this.firendsId,
            hidedGamesId: hidedGamesId ?? this.hidedGamesId,
        );

    factory UserFirestore.fromJson(Map<String, dynamic> json) => _$UserFirestoreFromJson(json);

    Map<String, dynamic> toJson() => _$UserFirestoreToJson(this);
}
