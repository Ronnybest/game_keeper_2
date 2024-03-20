import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GKAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GKAppBar(
      {super.key, this.title, this.actions, this.leading, this.bottom});

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      actions: actions,
      leading: Row(
        children: [
          leading ?? SizedBox(width: 5.w),
          IconButton.filledTonal(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              AutoRouter.of(context).maybePop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
