import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GKListItem extends StatelessWidget {
  const GKListItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.leading,
    this.trailing,
    this.onTap,
    required this.borderRadius,
  });

  final BorderRadius borderRadius;
  final String title;
  final String? subtitle;
  final String leading;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: borderRadius,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        child: Row(
          children: [
            // TODO: заменить на svg картинку
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  leading,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onSecondaryContainer,
                      BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) Text(subtitle!),
              ],
            ),
            const Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
