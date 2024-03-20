import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/auth/logic/bloc/auth_bloc.dart';
import 'package:game_keeper/modules/auth/ui/widgets/or_widget.dart';
import 'package:game_keeper/modules/auth/ui/widgets/other_auth_methods.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_button.dart';
import 'package:game_keeper/ui/widgets/gk_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class RegisterEmailScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterEmailScreen({super.key});

  @override
  State<RegisterEmailScreen> createState() => _RegisterEmailScreenState();

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

class _RegisterEmailScreenState extends State<RegisterEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GKAppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            emailRegisterLoading: () => context.loaderOverlay.show(),
            emailRegisterLoaded: (user) {
              context.loaderOverlay.hide();
              AutoRouter.of(context).popAndPush(const HomeRoute());
            },
            emailRegisterError: (error) {
              context.loaderOverlay.hide();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error.toString(),
                  ),
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: Text(
                      LocaleKeys.auth_register_welocome_subtitle.tr(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  GKTextField(
                    placeholder: LocaleKeys.auth_login_email.tr(),
                    hintText: LocaleKeys.auth_login_email_hint.tr(),
                    controller: _emailController,
                    validator: GetIt.I<Validators>().emailRegexValidator,
                  ),
                  const SizedBox(height: 20),
                  GKTextField(
                    placeholder: LocaleKeys.auth_login_password.tr(),
                    hintText: LocaleKeys.auth_login_password_hint.tr(),
                    controller: _passwordController,
                    validator: GetIt.I<Validators>().passwordValidator,
                  ),
                  const SizedBox(height: 20),
                  GKTextField(
                    placeholder: LocaleKeys.auth_register_confirm_password.tr(),
                    hintText:
                        LocaleKeys.auth_register_confirm_password_hint.tr(),
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return LocaleKeys.common_errors_confirm_password.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  GKButton(
                    text: LocaleKeys.auth_register_button.tr(),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthEvent.emailRegister(
                                _emailController.text,
                                _passwordController.text,
                              ),
                            );
                      }
                    },
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
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      LocaleKeys.auth_register_login_policy.tr(),
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
