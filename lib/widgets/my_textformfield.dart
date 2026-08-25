import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatefulWidget {
  final Color? textColor;
  final Color? hintTextColor;
  final double height, radius;
  final bool? isPassword;
  final FocusNode? focusNode;
  final String? hintText, label;
  final Color? bgColor;
  final Widget? suffixIcon, prefixIcon;
  final TextInputType keyBoardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FloatingLabelBehavior behavior;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final double? fontSize;
  final bool readOnly;
  final VoidCallback? onTap;

  const MyTextFormField({
    super.key,
    this.isPassword,
    this.focusNode,
    this.bgColor,
    this.suffixIcon,
    this.controller,
    this.keyBoardType = TextInputType.text,
    this.onChanged,
    this.hintText,
    this.behavior = FloatingLabelBehavior.auto,
    this.prefixIcon,
    this.label,
    this.height = 55,
    this.radius = 12,
    this.textColor,
    this.isEnabled = true,
    this.hintTextColor,
    this.validator,
    this.borderColor,
    this.fontSize,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool passInvisible = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveTextColor = widget.textColor ?? theme.colorScheme.onSurface;
    final effectiveHintColor = widget.hintTextColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.5);
    final effectiveBgColor = widget.bgColor ?? theme.cardTheme.color ?? theme.colorScheme.surfaceContainerHighest;
    final effectivePrimaryColor = theme.colorScheme.primary;

    return TextFormField(
      focusNode: widget.focusNode,
      enabled: widget.isEnabled,
      onChanged: widget.onChanged,
      maxLines: 1,
      validator: widget.validator,
      keyboardType: widget.keyBoardType,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      selectionHeightStyle: BoxHeightStyle.strut,
      cursorColor: effectivePrimaryColor,
      controller: widget.controller,
      obscureText: passInvisible && (widget.isPassword == true),
      style: GoogleFonts.urbanist(
        fontSize: widget.fontSize ?? 14,
        fontWeight: FontWeight.w500,
        color: effectiveTextColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.urbanist(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: effectiveHintColor,
        ),
        filled: true,
        fillColor: effectiveBgColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword == null
            ? widget.suffixIcon
            : InkWell(
                onTap: () {
                  setState(() {
                    passInvisible = !passInvisible;
                  });
                },
                child: Icon(
                  passInvisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            color: widget.borderColor ?? effectivePrimaryColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: widget.borderColor != null
              ? BorderSide(color: widget.borderColor!)
              : BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
        ),
      ),
    );
  }
}
