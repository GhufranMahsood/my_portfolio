import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/widgets/my_text.dart';

class StatsCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData? icon;

  const StatsCard({
    super.key,
    required this.number,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Container(
            padding: 10.allPadding,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.25),
                width: 1,
              ),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          14.horSpace,
        ],
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFF21BCFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds),
          child: MyText(
            text: number,
            fontSize: 44,
            fontWeight: FontWeight.w800,
            fontColor: Colors.white,
            height: 1.0,
          ),
        ),
        12.horSpace,
        MyText(
          text: label,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          fontColor: AppColors.textMuted,
          height: 1.35,
        ),
      ],
    );
  }
}

