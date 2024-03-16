import 'package:flutter/material.dart';

class GKTextField extends StatefulWidget {
  const GKTextField({
    super.key,
    required this.placeholder,
    required this.hintText,
    required this.prefixIcon,
  });

  final String placeholder;
  final String hintText;
  final Widget prefixIcon;

  @override
  State<GKTextField> createState() => _GKTextFieldState();
}

class _GKTextFieldState extends State<GKTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.placeholder,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
