import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/my_text.dart';

enum ButtonVariant { primary, outlined, ghost, actionPill }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final ButtonVariant variant;
  final double? width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.width,
    this.height = 48,
    this.borderRadius = 30,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onPressed,
      builder: (context, isHovered) {
        switch (variant) {
          case ButtonVariant.primary:
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: width,
              height: height,
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isHovered
                      ? [AppColors.primaryLight, AppColors.primary]
                      : [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.5),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    8.horSpace,
                  ],
                  MyText(
                    text: text,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontColor: AppColors.white,
                  ),
                ],
              ),
            );

          case ButtonVariant.outlined:
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: width,
              height: height,
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              decoration: BoxDecoration(
                color: isHovered
                    ? AppColors.primary.withValues(alpha: 0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: isHovered ? AppColors.primaryLight : AppColors.primary,
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    8.horSpace,
                  ],
                  MyText(
                    text: text,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontColor:
                        isHovered ? AppColors.primaryLight : AppColors.primary,
                  ),
                ],
              ),
            );

          case ButtonVariant.actionPill:
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isHovered
                    ? AppColors.primary.withValues(alpha: 0.25)
                    : AppColors.darkCardSecondary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isHovered
                      ? AppColors.primary
                      : AppColors.darkBorderLight,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    6.horSpace,
                  ],
                  MyText(
                    text: text,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontColor: isHovered
                        ? AppColors.textWhite
                        : AppColors.textLight,
                  ),
                ],
              ),
            );

          case ButtonVariant.ghost:
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    6.horSpace,
                  ],
                  MyText(
                    text: text,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontColor:
                        isHovered ? AppColors.primary : AppColors.textLight,
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}

