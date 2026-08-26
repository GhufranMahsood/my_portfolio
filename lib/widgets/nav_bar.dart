import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/controller/navigation_controller.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/enum.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/my_text.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;

  const NavBar({super.key, this.onMenuPressed});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final navController = NavigationController.to;

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkBackground.withValues(alpha: 0.85),
        border: const Border(
          bottom: BorderSide(color: AppColors.darkBorderLight, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Brand Logo
          HoverBuilder(
            onTap: () => navController.scrollToSection(SectionType.header),
            builder: (context, isHovered) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MyText(
                    text: '< ',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontColor: AppColors.primary,
                  ),
                  MyText(
                    text: AppConstants.firstName,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontColor: isHovered
                        ? AppColors.primaryLight
                        : AppColors.textWhite,
                  ),
                  const MyText(
                    text: ' />',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontColor: AppColors.primary,
                  ),
                ],
              );
            },
          ),

          // Desktop Nav Links
          if (isDesktop)
            Obx(
              () => Row(
                children: [
                  _NavItem(
                    title: 'About',
                    isActive: navController.activeSection.value ==
                        SectionType.about,
                    onTap: () =>
                        navController.scrollToSection(SectionType.about),
                  ),
                  32.horSpace,
                  _NavItem(
                    title: 'Tech',
                    isActive: navController.activeSection.value ==
                        SectionType.tech,
                    onTap: () =>
                        navController.scrollToSection(SectionType.tech),
                  ),
                  32.horSpace,
                  _NavItem(
                    title: 'Projects',
                    isActive: navController.activeSection.value ==
                        SectionType.projects,
                    onTap: () =>
                        navController.scrollToSection(SectionType.projects),
                  ),
                  32.horSpace,
                  _NavItem(
                    title: 'Experience',
                    isActive: navController.activeSection.value ==
                        SectionType.experience,
                    onTap: () =>
                        navController.scrollToSection(SectionType.experience),
                  ),
                  32.horSpace,
                  _NavItem(
                    title: 'Community',
                    isActive: navController.activeSection.value ==
                        SectionType.community,
                    onTap: () =>
                        navController.scrollToSection(SectionType.community),
                  ),
                  32.horSpace,
                  _NavItem(
                    title: 'Contact',
                    isActive: navController.activeSection.value ==
                        SectionType.contact,
                    onTap: () =>
                        navController.scrollToSection(SectionType.contact),
                  ),
                ],
              ),
            )
          else
            // Mobile hamburger button
            IconButton(
              onPressed: onMenuPressed,
              icon: const Icon(
                Icons.menu_rounded,
                color: AppColors.textWhite,
                size: 28,
              ),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        final activeColor = isActive
            ? AppColors.primary
            : (isHovered ? AppColors.primaryLight : AppColors.textLight);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: title,
              fontSize: 15,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              fontColor: activeColor,
            ),
            4.verSpace,
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isActive ? 20 : (isHovered ? 12 : 0),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        );
      },
    );
  }
}

