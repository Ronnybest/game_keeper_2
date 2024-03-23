import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GKTextField extends StatefulWidget {
  const GKTextField({
    super.key,
    this.placeholder,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    required this.validator,
    required this.controller,
    this.obscureText = false,
  });
  final bool obscureText;
  final bool isDisabled;
  final String? placeholder;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  @override
  State<GKTextField> createState() => _GKTextFieldState();
}

class _GKTextFieldState extends State<GKTextField> {
  FocusNode? _focusNode;
  bool _hasFocus = false;
  String? _errorText;
  bool isValidate = false;

  String? _processValidator(String? value) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
    return _errorText;
  }

  void _focusNodeListener() {
    if (!mounted) return;
    setState(() {
      _hasFocus = _focusNode!.hasFocus;
    });
  }

  void _clearText() {
    if (!mounted) {
      return;
    }
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.controller.clear());
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode!.addListener(_focusNodeListener);
  }

  @override
  void dispose() {
    _focusNode!.removeListener(() {
      _focusNodeListener();
    });
    _focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.placeholder!,
              style: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.9),
              ),
            ),
          ),
        ),
        TextFormField(
          enabled: !widget.isDisabled,
          controller: widget.controller,
          focusNode: _focusNode,
          onChanged: (value) {
            if (isValidate) {
              _processValidator(value);
            }
          },
          validator: (value) {
            setState(() {
              isValidate = true;
            });
            return _processValidator(value);
          },
          obscureText: widget.obscureText,
          style: TextStyle(
            color: !widget.isDisabled
                ? Theme.of(context).colorScheme.onBackground.withOpacity(.9)
                : Theme.of(context).colorScheme.onBackground.withOpacity(.6),
          ),
          decoration: InputDecoration(
            errorStyle:
                const TextStyle(height: 0.01, color: Colors.transparent),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.2),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.1),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.2),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: (widget.suffixIcon) ??
                (_hasFocus
                    ? GestureDetector(
                        onTap: _clearText,
                        child: Icon(
                          Icons.clear,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.6),
                        ),
                      )
                    : null),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              right: 5,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                _errorText!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
