import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginMethodsList {
  Future<bool> loginWithGoogle(BuildContext context) async {
    try {
      final user = await GetIt.I<AuthGoogle>().loginWithGoogle();
      if (user != null) {
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
