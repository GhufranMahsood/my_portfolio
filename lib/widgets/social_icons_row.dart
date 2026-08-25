import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/services/url_service.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';

class SocialIconsRow extends StatelessWidget {
  final double iconSize;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;

  const SocialIconsRow({
    super.key,
    this.iconSize = 18,
    this.spacing = 16,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _SocialItem(
        icon: FontAwesomeIcons.github,
        tooltip: 'GitHub',
        onTap: () => UrlService.openUrl(AppConstants.githubUrl),
      ),
      _SocialItem(
        icon: FontAwesomeIcons.linkedinIn,
        tooltip: 'LinkedIn',
        onTap: () => UrlService.openUrl(AppConstants.linkedinUrl),
      ),
      _SocialItem(
        icon: FontAwesomeIcons.xTwitter,
        tooltip: 'Twitter',
        onTap: () => UrlService.openUrl(AppConstants.twitterUrl),
      ),
      _SocialItem(
        icon: FontAwesomeIcons.whatsapp,
        tooltip: 'WhatsApp',
        onTap: () => UrlService.openUrl(AppConstants.whatsappUrl),
      ),
      _SocialItem(
        icon: FontAwesomeIcons.instagram,
        tooltip: 'Instagram',
        onTap: () => UrlService.openUrl(AppConstants.instagramUrl),
      ),
      _SocialItem(
        icon: FontAwesomeIcons.envelope,
        tooltip: 'Email',
        onTap: () => UrlService.sendEmail(AppConstants.email),
      ),
    ];

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.only(right: spacing),
          child: Tooltip(
            message: item.tooltip,
            child: HoverBuilder(
              onTap: item.onTap,
              builder: (context, isHovered) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isHovered
                        ? AppColors.primary.withValues(alpha: 0.2)
                        : AppColors.darkCardSecondary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isHovered
                          ? AppColors.primary
                          : AppColors.darkBorderLight,
                      width: 1,
                    ),
                  ),
                  child: item.icon is IconData
                      ? Icon(
                          item.icon as IconData,
                          size: iconSize,
                          color: isHovered
                              ? AppColors.primary
                              : AppColors.textLight,
                        )
                      : FaIcon(
                          item.icon,
                          size: iconSize,
                          color: isHovered
                              ? AppColors.primary
                              : AppColors.textLight,
                        ),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SocialItem {
  final dynamic icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialItem({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });
}
