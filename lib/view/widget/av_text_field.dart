import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AVTextField extends StatelessWidget {
  final String? label;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? formatters;
  final bool autoFocus;
  final bool? enabled;
  final bool obscureText;
  final TextInputAction? inputAction;
  final TextAlign? alignment;
  final String? initialValue;
  final String? helperText;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;

  const AVTextField({
    Key? key,
    this.label,
    this.inputType,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.inputAction,
    this.formatters,
    this.controller,
    this.autoFocus = false,
    this.enabled,
    this.obscureText = false,
    this.alignment,
    this.helperText,
    this.initialValue,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      enabled: enabled,
      initialValue: initialValue,
      style: const TextStyle(fontWeight: FontWeight.w700),
      autofocus: autoFocus,
      textAlign: alignment ?? TextAlign.start,
      decoration: InputDecoration(labelText: label, counterText: "", helperText: helperText),
      keyboardType: inputType,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: formatters,
      maxLength: maxLength,
      maxLines: 1,
      validator: validator,
      textInputAction: inputAction ?? TextInputAction.next,
      onChanged: onChanged,
    );
  }
}
