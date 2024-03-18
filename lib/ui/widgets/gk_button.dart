import 'package:flutter/material.dart';

class GKButton extends StatelessWidget {
  const GKButton({
    super.key,
    this.buttonColor,
    required this.child,
    required this.onTap,
  });

  final Color? buttonColor;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
