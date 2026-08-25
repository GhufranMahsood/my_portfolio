import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback? onTap;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign alignment;
  final TextOverflow overflow;
  final bool isUnderlined;
  final int maxLine;
  final double? height;

  const MyText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.fontColor,
    this.onTap,
    this.alignment = TextAlign.start,
    this.overflow = TextOverflow.visible,
    this.isUnderlined = false,
    this.maxLine = 10,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = fontColor ??
        Theme.of(context).textTheme.bodyMedium?.color ??
        Theme.of(context).colorScheme.onSurface;

    final textWidget = Text(
      text,
      maxLines: maxLine,
      overflow: overflow,
      textAlign: alignment,
      style: GoogleFonts.urbanist(
        fontSize: fontSize,
        color: effectiveColor,
        fontWeight: fontWeight,
        height: height,
        decoration:
            isUnderlined ? TextDecoration.underline : TextDecoration.none,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: textWidget,
      );
    }

    return textWidget;
  }
}
