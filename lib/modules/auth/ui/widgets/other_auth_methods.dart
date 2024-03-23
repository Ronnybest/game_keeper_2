import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/modules/auth/logic/utils/login_methods_list.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

class OtherAuthMethods extends StatelessWidget {
  const OtherAuthMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        LoginMethods.loginIcons.length,
        (index) => IconButton(
          onPressed: () async {
            if (context.mounted) {
              context.loaderOverlay.show();
            }
            final result =
                await GetIt.I<LoginMethodsList>().loginWithGoogle(context);
            if (context.mounted) {
              context.loaderOverlay.hide();
              if (result) {
                AutoRouter.of(context).replace(GKNavBar());
              }
            }
          },
          icon: FaIcon(
            LoginMethods.loginIcons[index],
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
