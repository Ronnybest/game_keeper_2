import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_button.dart';
import 'package:game_keeper/ui/widgets/gk_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class RestorePassScreen extends StatefulWidget implements AutoRouteWrapper {
  const RestorePassScreen({super.key});

  @override
  State<RestorePassScreen> createState() => _RestorePassScreenState();

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

class _RestorePassScreenState extends State<RestorePassScreen> {
  late TextEditingController _emailController;
  late TextEditingController _codeController;
  final _key = GlobalKey<FormState>();
  bool restoreSend = false;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _codeController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GKAppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            emailRestorePasswordLoading: () {
              context.loaderOverlay.show();
            },
            emailRestorePasswordLoaded: () {
              setState(() {
                restoreSend = true;
              });
              context.loaderOverlay.hide();
            },
            emailRestorePasswordError: (e) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.message!),
                ),
              );
            },
            orElse: () => null,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
                key: _key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(
                        LocaleKeys.auth_forgot_password_welocome_title.tr(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GKTextField(
                      validator: GetIt.I<Validators>().emailRegexValidator,
                      controller: _emailController,
                      placeholder: LocaleKeys.auth_forgot_password_email.tr(),
                      hintText: LocaleKeys.auth_forgot_password_email_hint.tr(),
                      isDisabled: restoreSend,
                    ),
                    const SizedBox(height: 20),
                    if (!restoreSend)
                      GKButton(
                        text: LocaleKeys.auth_forgot_password_button.tr(),
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthEvent.emailRestorePassword(
                                    _emailController.text,
                                  ),
                                );
                          }
                        },
                      ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          emailRestorePasswordLoaded: () {
                            return Column(
                              children: [
                                Text(
                                  LocaleKeys
                                      .auth_forgot_password_check_code_title
                                      .tr(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(.8),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(height: 20),
                                GKButton(
                                  text: LocaleKeys
                                      .auth_forgot_password_button_go_to_login
                                      .tr(),
                                  onTap: () {
                                    AutoRouter.of(context).maybePop(
                                      const AuthRoute(),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                          orElse: () => const SizedBox(),
                        );
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
