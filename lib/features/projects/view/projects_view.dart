import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/projects/model/project_model.dart';
import 'package:my_portfolio/features/projects/view_model/project_view_model.dart';
import 'package:my_portfolio/widgets/custom_button.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/section_header.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(ProjectViewModel());
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 90 : 54,
      ),
      child: Column(
        children: [
          const SectionHeader(
            tag: 'PORTFOLIO WORK',
            title: AppConstants.projectsTitle,
            subtitle: AppConstants.projectsSubtitle,
            isCenter: true,
          ),
          const SizedBox(height: 32),

          // Filter Tabs
          _FilterTabs(viewModel: viewModel),
          const SizedBox(height: 48),

          // Reactive Projects Grid
          Obx(() {
            final projects = viewModel.filteredProjects;

            return LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = (constraints.maxWidth -
                        ((crossAxisCount - 1) * (isDesktop ? 28 : 20))) /
                    crossAxisCount;

                return Wrap(
                  spacing: isDesktop ? 28 : 20,
                  runSpacing: isDesktop ? 28 : 20,
                  children: projects.map((project) {
                    return SizedBox(
                      width: itemWidth,
                      child: _ProjectCard(
                        project: project,
                        onLinkTap: viewModel.openActionLink,
                      ),
                    );
                  }).toList(),
                );
              },
            );
          }),

          const SizedBox(height: 54),

          // See More on GitHub Button
          CustomButton(
            text: 'Explore More on GitHub',
            onPressed: viewModel.seeMoreProjects,
            variant: ButtonVariant.outlined,
            icon: const Icon(
              Icons.arrow_outward_rounded,
              color: AppColors.primary,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterTabs extends StatelessWidget {
  final ProjectViewModel viewModel;

  const _FilterTabs({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final filters = [
      _FilterOption(label: 'All Projects', filter: ProjectFilter.all),
      _FilterOption(label: 'Open Source', filter: ProjectFilter.openSource),
      _FilterOption(label: 'Commercial Products', filter: ProjectFilter.product),
      _FilterOption(label: 'Dart Packages', filter: ProjectFilter.package),
    ];

    return Obx(() {
      return Wrap(
        spacing: 12,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: filters.map((option) {
          final isSelected = viewModel.activeFilter.value == option.filter;

          return HoverBuilder(
            onTap: () => viewModel.setFilter(option.filter),
            builder: (context, isHovered) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : (isHovered
                          ? AppColors.primary.withValues(alpha: 0.15)
                          : AppColors.darkCardSecondary),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : (isHovered
                            ? AppColors.primaryLight
                            : AppColors.darkBorder),
                    width: 1.2,
                  ),
                ),
                child: Text(
                  option.label,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected
                        ? AppColors.darkBackground
                        : (isHovered ? AppColors.textWhite : AppColors.textLight),
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
    });
  }
}

class _FilterOption {
  final String label;
  final ProjectFilter filter;

  const _FilterOption({required this.label, required this.filter});
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final Function(String) onLinkTap;

  const _ProjectCard({
    required this.project,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOpenSource = project.badgeType == ProjectBadgeType.openSource;
    final badgeBg = isOpenSource
        ? AppColors.openSourceBadgeBg
        : AppColors.productBadgeBg;
    final badgeColor = isOpenSource
        ? AppColors.openSourceBadgeText
        : AppColors.productBadgeText;
    final badgeText = isOpenSource ? 'Open Source' : 'Product';

    return HoverBuilder(
      builder: (context, isHovered) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: isHovered
              ? Matrix4.translationValues(0, -6, 0)
              : Matrix4.identity(),
          child: GlassContainer(
            padding: const EdgeInsets.all(18),
            borderRadius: 20,
            borderColor: isHovered
                ? AppColors.primary.withValues(alpha: 0.7)
                : AppColors.darkBorder,
            shadows: isHovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Tag Badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: badgeBg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: badgeColor, width: 1),
                      ),
                      child: Text(
                        badgeText,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: badgeColor,
                        ),
                      ),
                    ),
                    Icon(
                      isOpenSource
                          ? Icons.code_rounded
                          : Icons.verified_rounded,
                      size: 16,
                      color: AppColors.textDim,
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Browser Mockup Window Preview Frame
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkCardSecondary,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.darkBorder,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Window bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: const BoxDecoration(
                          color: AppColors.darkBackground,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF5F56),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFBD2E),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF27C93F),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Image Thumbnail
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(13)),
                          child: Image.asset(
                            project.imageAsset,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.darkCardSecondary,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.smartphone_rounded,
                                        color: AppColors.primary,
                                        size: 36,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        project.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColors.textMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Project Title
                Text(
                  project.title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  project.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textMuted,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),

                // Action Pill Buttons
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.actionLinks.map((link) {
                    return CustomButton(
                      text: link.title,
                      onPressed: () => onLinkTap(link.url),
                      variant: ButtonVariant.actionPill,
                      icon: link.icon is IconData
                          ? Icon(
                              link.icon as IconData,
                              size: 11,
                              color: AppColors.primary,
                            )
                          : FaIcon(
                              link.icon,
                              size: 11,
                              color: AppColors.primary,
                            ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
