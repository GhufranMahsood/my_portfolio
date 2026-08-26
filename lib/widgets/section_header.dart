import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/widgets/my_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? tag;
  final String? subtitle;
  final String? quote;
  final CrossAxisAlignment alignment;
  final bool isCenter;

  const SectionHeader({
    super.key,
    required this.title,
    this.tag,
    this.subtitle,
    this.quote,
    this.alignment = CrossAxisAlignment.center,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        if (tag != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.badgeBg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                8.horSpace,
                MyText(
                  text: tag!,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.primary,
                ),
              ],
            ),
          ),
          16.verSpace,
        ],

        // Section Title with gradient highlight
        MyText(
          text: title,
          alignment: isCenter ? TextAlign.center : TextAlign.start,
          fontSize: 38,
          fontWeight: FontWeight.w800,
          fontColor: AppColors.textWhite,
        ),

        if (quote != null) ...[
          14.verSpace,
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.8),
                    width: 3,
                  ),
                ),
              ),
              child: MyText(
                text: quote!,
                alignment: isCenter ? TextAlign.center : TextAlign.start,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.textMuted,
                height: 1.6,
              ),
            ),
          ),
        ],

        if (subtitle != null) ...[
          12.verSpace,
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: MyText(
              text: subtitle!,
              alignment: isCenter ? TextAlign.center : TextAlign.start,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontColor: AppColors.textMuted,
              height: 1.6,
            ),
          ),
        ],
      ],
    );
  }
}

