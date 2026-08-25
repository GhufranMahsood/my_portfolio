import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/experience/model/experience_model.dart';
import 'package:my_portfolio/features/experience/view_model/experience_view_model.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/section_header.dart';
import 'package:my_portfolio/widgets/tech_chip.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(ExperienceViewModel());
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 90 : 54,
      ),
      child: Column(
        children: [
          const SectionHeader(
            tag: 'CAREER TIMELINE',
            title: AppConstants.experienceTitle,
            subtitle: AppConstants.experienceSubtitle,
            isCenter: true,
          ),
          SizedBox(height: isDesktop ? 60 : 40),

          // Vertical Experience Timeline
          Column(
            children: viewModel.experiences.asMap().entries.map((entry) {
              final index = entry.key;
              final experience = entry.value;
              final isLast = index == viewModel.experiences.length - 1;

              return _TimelineItem(
                experience: experience,
                isLast: isLast,
                isDesktop: isDesktop,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final ExperienceModel experience;
  final bool isLast;
  final bool isDesktop;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Indicator Column
          if (isDesktop) ...[
            Column(
              children: [
                // Glowing Neon Node
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.darkBackground,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.6),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                // Connecting Vertical Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withValues(alpha: 0.2),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 28),
          ],

          // Card Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: HoverBuilder(
                builder: (context, isHovered) {
                  return GlassContainer(
                    padding: EdgeInsets.all(isDesktop ? 28 : 20),
                    borderRadius: 20,
                    borderColor: isHovered
                        ? AppColors.primary.withValues(alpha: 0.6)
                        : AppColors.darkBorder,
                    child: isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Meta Details
                              Expanded(
                                flex: 4,
                                child: _ExperienceMeta(experience: experience),
                              ),
                              const SizedBox(width: 32),
                              Container(
                                width: 1,
                                height: 200,
                                color: AppColors.darkBorderLight,
                              ),
                              const SizedBox(width: 32),
                              // Right Bullets
                              Expanded(
                                flex: 6,
                                child: _ExperienceBullets(
                                  bulletPoints: experience.bulletPoints,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ExperienceMeta(experience: experience),
                              const SizedBox(height: 20),
                              const Divider(color: AppColors.darkBorderLight),
                              const SizedBox(height: 16),
                              _ExperienceBullets(
                                bulletPoints: experience.bulletPoints,
                              ),
                            ],
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceMeta extends StatelessWidget {
  final ExperienceModel experience;

  const _ExperienceMeta({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Name
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.business_center_rounded,
                color: AppColors.primary,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                experience.company,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Role
        Text(
          experience.role,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 6),

        // Duration Chip
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.darkCardSecondary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.darkBorder, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 13,
                color: AppColors.primaryLight,
              ),
              const SizedBox(width: 6),
              Text(
                experience.duration,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Tech Stack
        Text(
          'Technologies & Tools',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: experience.technologies.map((tech) {
            return TechChip(label: tech, color: AppColors.primary);
          }).toList(),
        ),
      ],
    );
  }
}

class _ExperienceBullets extends StatelessWidget {
  final List<String> bulletPoints;

  const _ExperienceBullets({required this.bulletPoints});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: bulletPoints.map((bullet) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 7, right: 12),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.6),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  bullet,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textLight,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
