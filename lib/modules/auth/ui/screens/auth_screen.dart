import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/core/translations/locale_keys.g.dart';
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

  // void validate() {
  //   _formKey.currentState!.validate();
  // }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // _emailController.addListener(() {
    //   validate();
    // });
    // _passwordController.addListener(() {
    //   validate();
    // });
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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(
                      LocaleKeys.auth_login_welocome_title.tr(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  GKTextField(
                    controller: _emailController,
                    placeholder: LocaleKeys.auth_login_email.tr(),
                    hintText: LocaleKeys.auth_login_email_hint.tr(),
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
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        LocaleKeys.auth_login_forget_pass.tr(),
                        style: TextStyle(
                          color: Colors.greenAccent.withOpacity(0.5),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GKButton(
                          buttonColor: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            LocaleKeys.common_buttons_login.tr(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 15.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate() == true) {
                            } else {
                              return;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GKButton(
                          onTap: () {
                            if (_formKey.currentState!.validate() == true) {
                            } else {
                              return;
                            }
                          },
                          child: Text(
                            LocaleKeys.common_buttons_register.tr(),
                            style: TextStyle(
                              fontSize: 15.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            LocaleKeys.auth_login_login_or.tr(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.6),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      LocaleKeys.auth_login_login_policy.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.4),
                            fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
