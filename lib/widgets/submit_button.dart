import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/widgets/my_text.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final double height;
  final double? width;
  final double iconSize, fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final Color borderColor;
  final Color? loadingColor;
  final double radius;
  final bool isArrow;
  final bool isIcon;
  final IconData icon;
  final TextDirection? textDirection;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const SubmitButton({
    super.key,
    required this.title,
    this.onTap,
    this.height = 50,
    this.width,
    this.isLoading = false,
    this.color,
    this.iconColor,
    this.loadingColor,
    this.textColor,
    this.radius = 30,
    this.borderColor = Colors.transparent,
    this.isArrow = false,
    this.iconSize = 22,
    this.fontSize = 16,
    this.isIcon = false,
    this.icon = Icons.headset_mic_outlined,
    this.fontWeight = FontWeight.w600,
    this.textDirection,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;
    final effectiveTextColor = textColor ?? theme.colorScheme.onPrimary;
    final effectiveIconColor = iconColor ?? effectiveTextColor;
    final effectiveLoadingColor = loadingColor ?? effectiveTextColor;
    final BorderRadius borderRadius = BorderRadius.circular(radius);

    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: borderRadius,
      color: effectiveColor,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 14),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: borderColor),
          ),
          child: isLoading
              ? Center(
                  child: CupertinoActivityIndicator(
                    color: effectiveLoadingColor,
                  ),
                )
              : Row(
                  textDirection: textDirection,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isArrow && isIcon) ...[
                      Icon(icon, color: effectiveIconColor, size: iconSize),
                      6.horSpace,
                    ],
                    Flexible(
                      child: MyText(
                        text: title,
                        fontSize: fontSize,
                        fontColor: effectiveTextColor,
                        fontWeight: fontWeight,
                        alignment: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isArrow) ...[
                      6.horSpace,
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: effectiveIconColor,
                        size: iconSize,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
