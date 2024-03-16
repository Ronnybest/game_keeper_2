import 'package:flutter/material.dart';

class GKButton extends StatelessWidget {
  const GKButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
