import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/auth/logic/utils/auth_google.dart';
import 'package:game_keeper/ui/widgets/gk_button.dart';
import 'package:game_keeper/ui/widgets/gk_text_field.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool obscureText = true;
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

  void validate() {
    _formKey.currentState!.validate();
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(() {
      validate();
    });
    _passwordController.addListener(() {
      validate();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.auth_login_title.tr(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   padding: const EdgeInsets.only(
              //     top: 0,
              //     bottom: 20,
              //   ),
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     LocaleKeys.auth_login_welocome_title.tr(),
              //     //textAlign: TextAlign.start,
              //     style: TextStyle(
              //       fontSize: 18.sp,
              //     ),
              //   ),
              // ),
              GKTextField(
                controller: _emailController,
                placeholder: LocaleKeys.auth_login_email.tr(),
                hintText: LocaleKeys.auth_login_email_hint.tr(),
                prefixIcon: const Icon(Icons.email),
                validator: GetIt.I<Validators>().emailRegexValidator,
              ),
              const SizedBox(
                height: 20,
              ),
              GKTextField(
                controller: _passwordController,
                placeholder: LocaleKeys.auth_login_password.tr(),
                hintText: LocaleKeys.auth_login_password_hint.tr(),
                obscureText: obscureText,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                validator: GetIt.I<Validators>().passwordValidator,
              ),
              GestureDetector(
                onTap: () {
                  // TODO : Navigate to forget password screen
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    LocaleKeys.auth_login_forget_pass.tr(),
                    style: TextStyle(
                      color: Colors.blueAccent.withOpacity(0.5),
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5,
                      decorationColor: Colors.blueAccent.withOpacity(0.5),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GKButton(
                      child: Text(
                        LocaleKeys.common_buttons_login.tr(),
                        style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GKButton(
                      child: Text(
                        LocaleKeys.common_buttons_register.tr(),
                        style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  LocaleKeys.auth_login_login_with.tr(),
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  LoginMethods.loginIcons.length,
                  (index) => IconButton(
                    onPressed: _loginWithGoogle,
                    icon: FaIcon(
                      LoginMethods.loginIcons[index],
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
