import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';

class TechChip extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Color? color;
  final VoidCallback? onTap;

  const TechChip({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;

    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? chipColor.withValues(alpha: 0.2)
                : AppColors.darkCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered
                  ? chipColor
                  : chipColor.withValues(alpha: 0.35),
              width: 1.2,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: chipColor.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isHovered ? AppColors.textWhite : AppColors.textLight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
