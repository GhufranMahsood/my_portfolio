import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/controller/navigation_controller.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/enum.dart';
import 'package:my_portfolio/features/header/view_model/header_view_model.dart';
import 'package:my_portfolio/widgets/custom_button.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/social_icons_row.dart';
import 'package:my_portfolio/widgets/stats_card.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(HeaderViewModel());
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 70 : 40,
      ),
      child: Column(
        children: [
          // Main Hero content
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _HeroTextContent(viewModel: viewModel),
                ),
                const SizedBox(width: 48),
                Expanded(
                  flex: 5,
                  child: _HeroImageWithFloatingBadges(
                    profileAsset: viewModel.headerData.profileAsset,
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _HeroImageWithFloatingBadges(
                  profileAsset: viewModel.headerData.profileAsset,
                  size: isTablet ? 280 : 220,
                ),
                const SizedBox(height: 40),
                _HeroTextContent(viewModel: viewModel, isCenter: true),
              ],
            ),

          SizedBox(height: isDesktop ? 70 : 44),

          // Hero Metrics Banner
          GlassContainer(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48 : 24,
              vertical: 28,
            ),
            borderRadius: 24,
            borderColor: AppColors.primary.withValues(alpha: 0.25),
            child: isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StatsCard(
                        number: viewModel.headerData.metrics[0].count,
                        label: viewModel.headerData.metrics[0].label,
                        icon: Icons.history_edu_rounded,
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.darkBorder,
                      ),
                      StatsCard(
                        number: viewModel.headerData.metrics[1].count,
                        label: viewModel.headerData.metrics[1].label,
                        icon: Icons.rocket_launch_rounded,
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.darkBorder,
                      ),
                      StatsCard(
                        number: viewModel.headerData.metrics[2].count,
                        label: viewModel.headerData.metrics[2].label,
                        icon: Icons.visibility_rounded,
                      ),
                    ],
                  )
                : Wrap(
                    spacing: 28,
                    runSpacing: 24,
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      StatsCard(
                        number: viewModel.headerData.metrics[0].count,
                        label: viewModel.headerData.metrics[0].label,
                        icon: Icons.history_edu_rounded,
                      ),
                      StatsCard(
                        number: viewModel.headerData.metrics[1].count,
                        label: viewModel.headerData.metrics[1].label,
                        icon: Icons.rocket_launch_rounded,
                      ),
                      StatsCard(
                        number: viewModel.headerData.metrics[2].count,
                        label: viewModel.headerData.metrics[2].label,
                        icon: Icons.visibility_rounded,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _HeroTextContent extends StatelessWidget {
  final HeaderViewModel viewModel;
  final bool isCenter;

  const _HeroTextContent({required this.viewModel, this.isCenter = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCenter
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Live Availability Status Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.badgeBg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.8),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for New Projects',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Dual-Tone Gradient Headline
        RichText(
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: '${AppConstants.firstName}\n',
                style: GoogleFonts.poppins(
                  fontSize: isCenter ? 44 : 60,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textWhite,
                  height: 1.1,
                  letterSpacing: -1,
                ),
              ),
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF21BCFF), Color(0xFF00E5FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    AppConstants.lastName.isNotEmpty
                        ? AppConstants.lastName
                        : 'Engineer',
                    style: GoogleFonts.poppins(
                      fontSize: isCenter ? 44 : 60,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.1,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Subtitle Role
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.darkCardSecondary,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.darkBorder, width: 1),
              ),
              child: const Icon(
                Icons.flutter_dash,
                color: AppColors.primary,
                size: 16,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              viewModel.headerData.role,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Social Icons Row
        SocialIconsRow(
          mainAxisAlignment: isCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
        ),
        const SizedBox(height: 32),

        // Action Buttons Row
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isCenter ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              text: "LET'S CHAT!",
              onPressed: viewModel.onChatPressed,
              icon: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
            CustomButton(
              text: "View Projects",
              onPressed: () =>
                  NavigationController.to.scrollToSection(SectionType.projects),
              variant: ButtonVariant.outlined,
              icon: const Icon(
                Icons.work_outline_rounded,
                color: AppColors.primary,
                size: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroImageWithFloatingBadges extends StatelessWidget {
  final String profileAsset;
  final double size;

  const _HeroImageWithFloatingBadges({
    required this.profileAsset,
    this.size = 380,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size * 1.25,
        height: size * 1.25,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Outer Glowing Cyan Halo Ring
            Container(
              width: size * 1.08,
              height: size * 1.08,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    blurRadius: 70,
                    spreadRadius: 8,
                  ),
                ],
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
            ),

            // Main Circular Avatar Frame
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkCard,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.6),
                  width: 3.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  profileAsset,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.45),
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.darkCardSecondary,
                      child: const Center(
                        child: Icon(
                          Icons.person_rounded,
                          size: 110,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Floating Badge 1: Flutter Specialist (Top Left)
            Positioned(
              top: 18,
              left: 0,
              child: _FloatingSkillBadge(
                icon: Icons.flutter_dash,
                label: 'Flutter Specialist',
                color: AppColors.primary,
              ),
            ),

            // Floating Badge 2: Clean Arch (Bottom Right)
            Positioned(
              bottom: 24,
              right: 0,
              child: _FloatingSkillBadge(
                icon: Icons.account_tree_rounded,
                label: 'Clean Architecture',
                color: const Color(0xFF00E5FF),
              ),
            ),

            // Floating Badge 3: 60 FPS UI (Bottom Left)
            Positioned(
              bottom: 18,
              left: 10,
              child: _FloatingSkillBadge(
                icon: Icons.speed_rounded,
                label: '60 FPS Smooth UI',
                color: const Color(0xFF818CF8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingSkillBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _FloatingSkillBadge({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCard.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textWhite,
            ),
          ),
        ],
      ),
    );
  }
}
