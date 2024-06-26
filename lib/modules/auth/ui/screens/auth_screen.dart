import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart';
import 'package:game_keeper/modules/auth/ui/widgets/or_widget.dart';
import 'package:game_keeper/modules/auth/ui/widgets/other_auth_methods.dart';
import 'package:game_keeper/ui/widgets/gk_button.dart';
import 'package:game_keeper/ui/widgets/gk_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class AuthScreen extends StatefulWidget implements AutoRouteWrapper {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => GetIt.I<AuthBloc>(),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool obscureText = true;

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
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) => state.maybeWhen(
              emailLoginLoading: () {
                context.loaderOverlay.show();
                return null;
              },
              emailLoginLoaded: (user) {
                context.loaderOverlay.hide();
                AutoRouter.of(context)
                    .pushAndPopUntil(GKNavBar(), predicate: (_) => false);
                return null;
              },
              emailLoginError: (error) {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message!),
                  ),
                );
                return null;
              },
              emailLoginUserNotFound: () {
                context.loaderOverlay.hide();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      LocaleKeys.common_errors_password_email_incorrect.tr(),
                    ),
                  ),
                );
                return null;
              },
              orElse: () => null,
            ),
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
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
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
                      validator: GetIt.I<Validators>().requiredValidator,
                    ),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(const RestorePassRoute());
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LocaleKeys.auth_login_forget_pass.tr(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
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
                          // login button
                          child: GKButton(
                            buttonColor:
                                Theme.of(context).colorScheme.secondary,
                            textColor:
                                Theme.of(context).colorScheme.onSecondary,
                            text: LocaleKeys.common_buttons_login.tr(),
                            onTap: () {
                              if (_formKey.currentState!.validate() == true) {
                                context.read<AuthBloc>().add(
                                      AuthEvent.emailLogIn(
                                        _emailController.text,
                                        _passwordController.text,
                                      ),
                                    );
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
                          // register button
                          child: GKButton(
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(const RegisterEmailRoute());
                            },
                            text: LocaleKeys.common_buttons_register.tr(),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: OrWidget(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: OtherAuthMethods(),
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
      ),
    );
  }
}
