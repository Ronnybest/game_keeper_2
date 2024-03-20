import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            LocaleKeys.auth_login_login_or.tr(),
            style: TextStyle(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.6),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.15),
          ),
        ),
      ],
    );
  }
}
