import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:game_keeper/core/models/user_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserInfoFirestore {
  late UserFirestore userFirestore;
  UserFirestore get getUserFirestore => userFirestore;
  Future<void> saveUserInfo(User user) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    UserFirestore data = UserFirestore(
      email: user.email,
      name: user.displayName,
      photoUrl: user.photoURL,
      uid: user.uid,
      bookMarkedGamesId: <int>[],
      currentPlayingGamesId: <int>[],
      firendsId: <String>[],
      hidedGamesId: <int>[],
    );
    await userRef.set(data.toJson(), SetOptions(merge: true)).onError(
        (error, stackTrace) => throw Exception(error)); // TODO handle error
  }

  Future<UserFirestore?> getUserInfo(User user) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    final doc = await userRef.get();
    if (doc.exists) {
      userFirestore = UserFirestore.fromJson(doc.data()!);
      return UserFirestore.fromJson(doc.data()!);
    } else {
      return throw Exception('User not found');
    }
  }

  Future<void> updateUserInfo(UserFirestore user) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    await userRef
        .update(user.toJson())
        .onError((error, stackTrace) => Exception(error)); // TODO handle error
    userFirestore = UserFirestore.fromJson(user.toJson());
  }

  Future<void> deleteUserInfo(User user) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    await userRef.delete().onError(
        (error, stackTrace) => throw Exception(error)); // TODO handle error
  }

  Future<void> deleteUserInfoByKeyAndValue(String key, dynamic value) async {
    final userRef = FirebaseFirestore.instance.collection('users');
    await userRef
        .where(key, isEqualTo: value)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              element.reference.delete();
            },
          ),
        )
        .onError(
            (error, stackTrace) => throw Exception(error)); // TODO handle error
  }

  Future<void> updateOneData(String key, dynamic value) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(userFirestore.uid);
    await userRef.update({key: value}).onError(
        (error, stackTrace) => throw Exception(error)); // TODO handle error
    userFirestore = UserFirestore.fromJson(
        await userRef.get().then((value) => value.data()!));
  }
}
