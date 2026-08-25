import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/controller/navigation_controller.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/theme/app_text_styles.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/enum.dart';
import 'package:my_portfolio/features/about/view_model/about_view_model.dart';
import 'package:my_portfolio/widgets/custom_button.dart';
import 'package:my_portfolio/widgets/glass_container.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(AboutViewModel());
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 90 : 54,
      ),
      child: Column(
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 5,
                  child: _ProfileHighlightsCard(),
                ),
                const SizedBox(width: 56),
                Expanded(
                  flex: 7,
                  child: _AboutDetails(viewModel: viewModel),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _AboutDetails(viewModel: viewModel, isCenter: !isTablet),
                const SizedBox(height: 40),
                const _ProfileHighlightsCard(),
              ],
            ),

          const SizedBox(height: 56),

          // 4 Core Engineering Pillars
          _CorePillarsGrid(isDesktop: isDesktop, isTablet: isTablet),
        ],
      ),
    );
  }
}

class _ProfileHighlightsCard extends StatelessWidget {
  const _ProfileHighlightsCard();

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(28),
      borderRadius: 22,
      borderColor: AppColors.primary.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Badge
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.badge_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite,
                      ),
                    ),
                    Text(
                      AppConstants.role,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Divider(color: AppColors.darkBorderLight),
          const SizedBox(height: 20),

          // Details List
          _infoTile(
            icon: Icons.location_on_outlined,
            title: 'Location',
            value: AppConstants.location,
          ),
          const SizedBox(height: 16),
          _infoTile(
            icon: Icons.work_history_outlined,
            title: 'Experience',
            value: '${AppConstants.expYears}+ Years (Startup & Enterprise)',
          ),
          const SizedBox(height: 16),
          _infoTile(
            icon: Icons.flutter_dash,
            title: 'Core Domain',
            value: 'Flutter, Dart, Mobile & Web Architecture',
          ),
          const SizedBox(height: 16),
          _infoTile(
            icon: Icons.check_circle_outline_rounded,
            title: 'Availability',
            value: 'Open for High-Impact Projects / Full-Time',
          ),

          const SizedBox(height: 24),

          // Quick Tech Tags
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.darkCardSecondary,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.darkBorder, width: 1),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                _MiniTag('Clean Code'),
                _MiniTag('Bloc Pattern'),
                _MiniTag('REST & GraphQL'),
                _MiniTag('CI/CD Pipelines'),
                _MiniTag('60 FPS UI'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDim,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MiniTag extends StatelessWidget {
  final String label;

  const _MiniTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.textLight,
        ),
      ),
    );
  }
}

class _AboutDetails extends StatelessWidget {
  final AboutViewModel viewModel;
  final bool isCenter;

  const _AboutDetails({
    required this.viewModel,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Section Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.badgeBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Text(
            viewModel.aboutData.title,
            style: GoogleFonts.firaCode(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 18),

        // Heading
        RichText(
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          text: TextSpan(
            text: 'Hello there! My name\nis ',
            style: GoogleFonts.poppins(
              fontSize: isCenter ? 32 : 44,
              fontWeight: FontWeight.w700,
              color: AppColors.textWhite,
              height: 1.15,
              letterSpacing: -0.5,
            ),
            children: [
              TextSpan(
                text: AppConstants.firstName,
                style: GoogleFonts.poppins(
                  fontSize: isCenter ? 32 : 44,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),

        // Quote
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.primary, width: 3),
            ),
          ),
          child: Text(
            viewModel.aboutData.quote,
            style: AppTextStyles.quoteText,
          ),
        ),
        const SizedBox(height: 24),

        // Bio text
        Text(
          viewModel.aboutData.bio,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: AppTextStyles.bodyText,
        ),
        const SizedBox(height: 32),

        // Action Buttons Row
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isCenter ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              text: 'Download Resume',
              onPressed: viewModel.downloadResume,
              icon: const Icon(
                Icons.file_download_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            CustomButton(
              text: 'Get In Touch',
              onPressed: () => NavigationController.to
                  .scrollToSection(SectionType.contact),
              variant: ButtonVariant.outlined,
              icon: const Icon(
                Icons.mail_outline_rounded,
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

class _CorePillarsGrid extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;

  const _CorePillarsGrid({
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    final pillars = [
      _PillarItem(
        icon: Icons.layers_rounded,
        title: 'Clean Architecture',
        desc: 'Modular, testable, and scalable enterprise code separation.',
        color: AppColors.primary,
      ),
      _PillarItem(
        icon: Icons.tune_rounded,
        title: 'Bloc & State Mgmt',
        desc: 'Robust state management for complex and reactive workflows.',
        color: const Color(0xFF00E5FF),
      ),
      _PillarItem(
        icon: Icons.speed_rounded,
        title: 'High Performance',
        desc: 'Optimized rendering pipelines delivering butter-smooth 60 FPS.',
        color: const Color(0xFF818CF8),
      ),
      _PillarItem(
        icon: Icons.rocket_launch_rounded,
        title: 'Fast Delivery',
        desc: 'Agile sprints, automated CI/CD, and rapid production deployment.',
        color: const Color(0xFFA855F7),
      ),
    ];

    final crossAxisCount = isDesktop ? 4 : (isTablet ? 2 : 1);

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth -
                ((crossAxisCount - 1) * 16)) /
            crossAxisCount;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: pillars.map((pillar) {
            return SizedBox(
              width: itemWidth,
              child: GlassContainer(
                padding: const EdgeInsets.all(20),
                borderRadius: 16,
                borderColor: pillar.color.withValues(alpha: 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: pillar.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(pillar.icon, color: pillar.color, size: 22),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      pillar.title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      pillar.desc,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMuted,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _PillarItem {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  const _PillarItem({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
  });
}
