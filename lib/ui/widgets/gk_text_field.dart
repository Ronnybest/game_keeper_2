import 'package:flutter/material.dart';

class GKTextField extends StatefulWidget {
  const GKTextField({
    super.key,
    this.placeholder,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    required this.controller,
    this.obscureText = false,
  });
  final bool obscureText;
  final String? placeholder;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String? value) validator;

  @override
  State<GKTextField> createState() => _GKTextFieldState();
}

class _GKTextFieldState extends State<GKTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.placeholder,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
