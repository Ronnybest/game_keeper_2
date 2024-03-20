import 'package:flutter/material.dart';

class GKButton extends StatelessWidget {
  const GKButton({
    super.key,
    this.textColor,
    this.buttonColor,
    this.customChild,
    required this.text,
    required this.onTap,
  });

  final Color? buttonColor;
  final String text;
  final Widget? customChild;
  final Function onTap;
  final Color? textColor;

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
        child: customChild ??
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      ),
    );
  }
}
