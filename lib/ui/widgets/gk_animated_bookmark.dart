import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GKAnimatedBookmark extends StatelessWidget {
  const GKAnimatedBookmark(
      {super.key,
      required this.isBookmarked,
      this.right,
      this.top,
      this.left,
      this.bottom});

  final bool isBookmarked;
  final double? right;
  final double? top;
  final double? left;
  final double? bottom;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      right: 15,
      left: left,
      bottom: bottom,
      top: isBookmarked ? top : -70,
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticInOut,
      child: SizedBox(
        width: 50,
        height: 50,
        child: SvgPicture.asset(
          'assets/images/bookmark_icon.svg',
          colorFilter:  ColorFilter.mode(
            Colors.orange.shade400,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
