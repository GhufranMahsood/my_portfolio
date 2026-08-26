import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/features/experience/view_model/community_view_model.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/my_text.dart';
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
          (isDesktop ? 54 : 36).verSpace,

          // Academic & Dev Metrics Row Banner
          GlassContainer(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48 : 24,
              vertical: 28,
            ),
            borderRadius: 24,
            borderColor: AppColors.primary.withValues(alpha: 0.25),
            child: isDesktop
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                : const Wrap(
                    spacing: 28,
                    runSpacing: 24,
                    alignment: WrapAlignment.spaceAround,
                    children: [
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

          (isDesktop ? 48 : 36).verSpace,

          // Community Leadership Cards
          Column(
            children: viewModel.communities.map((community) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: HoverBuilder(
                  builder: (context, isHovered) {
                    return GlassContainer(
                      padding: (isDesktop ? 26 : 20).allPadding,
                      borderRadius: 20,
                      borderColor: isHovered
                          ? community.brandColor.withValues(alpha: 0.7)
                          : AppColors.darkBorder,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand Icon Box
                          Container(
                            padding: 14.allPadding,
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
                          20.horSpace,

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
                                      child: MyText(
                                        text: community.title,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontColor: AppColors.textWhite,
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
                                        child: MyText(
                                          text: community.duration,
                                          fontSize: 12,
                                          fontColor: AppColors.textLight,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  ],
                                ),
                                4.verSpace,
                                MyText(
                                  text: community.role,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontColor: community.brandColor,
                                ),
                                if (!isDesktop) ...[
                                  4.verSpace,
                                  MyText(
                                    text: community.duration,
                                    fontSize: 12,
                                    fontColor: AppColors.textDim,
                                  ),
                                ],
                                12.verSpace,
                                MyText(
                                  text: community.description,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontColor: AppColors.textLight,
                                  height: 1.6,
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

