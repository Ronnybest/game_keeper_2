import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart';
import 'package:game_keeper/ui/widgets/gk_text_field.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Future<void> _loginWithGoogle() async {
    try {
      final user = await GetIt.I<AuthGoogle>().loginWithGoogle();
      if (user != null) {
        if (mounted) {
          AutoRouter.of(context).replace(const HomeRoute());
        }
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
          ),
        );
      }
      return;
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Column(
        children: [
          const Text('Auth with Google'),
          IconButton(
            onPressed: () {
              _loginWithGoogle();
            },
            icon: const Icon(Icons.login),
          ),
          GKTextField(
            placeholder: 'Email',
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email),
          ),
        ],
      ),
    );
  }
}
