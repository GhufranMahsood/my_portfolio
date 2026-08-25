import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/experience/view_model/community_view_model.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/section_header.dart';
import 'package:my_portfolio/widgets/stats_card.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(CommunityViewModel());
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
            tag: 'EDUCATION & BACKGROUND',
            title: AppConstants.communityTitle,
            quote: AppConstants.communityQuote,
            isCenter: true,
          ),
          SizedBox(height: isDesktop ? 54 : 36),

          // Academic & Dev Metrics Row Banner
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
                    children: const [
                      StatsCard(
                        number: AppConstants.communityEvents,
                        label: AppConstants.communityEventsLabel,
                        icon: Icons.school_rounded,
                      ),
                      StatsCard(
                        number: AppConstants.communityEngagements,
                        label: AppConstants.communityEngagementsLabel,
                        icon: Icons.history_edu_rounded,
                      ),
                      StatsCard(
                        number: AppConstants.communityGlobal,
                        label: AppConstants.communityGlobalLabel,
                        icon: Icons.rocket_launch_rounded,
                      ),
                    ],
                  )
                : Wrap(
                    spacing: 28,
                    runSpacing: 24,
                    alignment: WrapAlignment.spaceAround,
                    children: const [
                      StatsCard(
                        number: AppConstants.communityEvents,
                        label: AppConstants.communityEventsLabel,
                        icon: Icons.school_rounded,
                      ),
                      StatsCard(
                        number: AppConstants.communityEngagements,
                        label: AppConstants.communityEngagementsLabel,
                        icon: Icons.history_edu_rounded,
                      ),
                      StatsCard(
                        number: AppConstants.communityGlobal,
                        label: AppConstants.communityGlobalLabel,
                        icon: Icons.rocket_launch_rounded,
                      ),
                    ],
                  ),
          ),

          SizedBox(height: isDesktop ? 48 : 36),

          // Community Leadership Cards
          Column(
            children: viewModel.communities.map((community) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: HoverBuilder(
                  builder: (context, isHovered) {
                    return GlassContainer(
                      padding: EdgeInsets.all(isDesktop ? 26 : 20),
                      borderRadius: 20,
                      borderColor: isHovered
                          ? community.brandColor.withValues(alpha: 0.7)
                          : AppColors.darkBorder,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand Icon Box
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: community.brandColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: community.brandColor.withValues(alpha: 0.35),
                                width: 1,
                              ),
                            ),
                            child: community.icon is IconData
                                ? Icon(
                                    community.icon as IconData,
                                    size: 24,
                                    color: community.brandColor,
                                  )
                                : FaIcon(
                                    community.icon,
                                    size: 24,
                                    color: community.brandColor,
                                  ),
                          ),
                          const SizedBox(width: 20),

                          // Text Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        community.title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textWhite,
                                        ),
                                      ),
                                    ),
                                    if (isDesktop)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.darkCardSecondary,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: AppColors.darkBorder,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          community.duration,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: AppColors.textLight,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  community.role,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: community.brandColor,
                                  ),
                                ),
                                if (!isDesktop) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    community.duration,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: AppColors.textDim,
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 12),
                                Text(
                                  community.description,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textLight,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
