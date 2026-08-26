import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/features/experience/model/experience_model.dart';
import 'package:my_portfolio/features/experience/view_model/experience_view_model.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/my_text.dart';
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
          (isDesktop ? 60 : 40).verSpace,

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
            28.horSpace,
          ],

          // Card Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: HoverBuilder(
                builder: (context, isHovered) {
                  return GlassContainer(
                    padding: (isDesktop ? 28 : 20).allPadding,
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
                              32.horSpace,
                              Container(
                                width: 1,
                                height: 200,
                                color: AppColors.darkBorderLight,
                              ),
                              32.horSpace,
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
                              20.verSpace,
                              const Divider(color: AppColors.darkBorderLight),
                              16.verSpace,
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
              padding: 8.allPadding,
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
            12.horSpace,
            Expanded(
              child: MyText(
                text: experience.company,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontColor: AppColors.textWhite,
              ),
            ),
          ],
        ),
        10.verSpace,

        // Role
        MyText(
          text: experience.role,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontColor: AppColors.primary,
        ),
        6.verSpace,

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
              6.horSpace,
              MyText(
                text: experience.duration,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.textLight,
              ),
            ],
          ),
        ),
        20.verSpace,

        // Tech Stack
        const MyText(
          text: 'Technologies & Tools',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontColor: AppColors.textMuted,
        ),
        10.verSpace,
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
                child: MyText(
                  text: bullet,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontColor: AppColors.textLight,
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

