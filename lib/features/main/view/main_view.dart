import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/controller/navigation_controller.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/extensions.dart';
import 'package:my_portfolio/features/about/view/about_view.dart';
import 'package:my_portfolio/features/contact_us/view/contact_view.dart';
import 'package:my_portfolio/features/experience/view/community_view.dart';
import 'package:my_portfolio/features/experience/view/experience_view.dart';
import 'package:my_portfolio/features/header/view/header_view.dart';
import 'package:my_portfolio/features/main/view_model/main_view_model.dart';
import 'package:my_portfolio/features/projects/view/projects_view.dart';
import 'package:my_portfolio/features/skill/view/skill_view.dart';
import 'package:my_portfolio/widgets/ambient_glow_background.dart';
import 'package:my_portfolio/widgets/my_text.dart';
import 'package:my_portfolio/widgets/nav_bar.dart';
import 'package:my_portfolio/widgets/social_icons_row.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    final mainViewModel = Get.put(MainViewModel());

    return Scaffold(
      key: mainViewModel.scaffoldKey,
      backgroundColor: AppColors.darkBackground,
      endDrawer: _MobileDrawer(
        mainViewModel: mainViewModel,
        navController: navController,
      ),
      floatingActionButton: Obx(
        () => navController.showBackToTop.value
            ? FloatingActionButton.small(
                onPressed: navController.scrollToTop,
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 6,
                tooltip: 'Back to top',
                child: const Icon(Icons.keyboard_arrow_up_rounded, size: 22),
              )
            : const SizedBox.shrink(),
      ),
      body: AmbientGlowBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Top Navigation Bar
              NavBar(
                onMenuPressed: mainViewModel.openDrawer,
              ),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  controller: navController.scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1280),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // 1. Header (Hero) Section
                          Container(
                            key: navController.headerKey,
                            child: const HeaderView(),
                          ),

                          const _SectionDivider(),

                          // 2. About Me Section
                          Container(
                            key: navController.aboutKey,
                            child: const AboutView(),
                          ),

                          const _SectionDivider(),

                          // 3. Tech Stack Section
                          Container(
                            key: navController.techKey,
                            child: const SkillView(),
                          ),

                          const _SectionDivider(),

                          // 4. Projects Section
                          Container(
                            key: navController.projectsKey,
                            child: const ProjectsView(),
                          ),

                          const _SectionDivider(),

                          // 5. Experience Section
                          Container(
                            key: navController.experienceKey,
                            child: const ExperienceView(),
                          ),

                          const _SectionDivider(),

                          // 6. Community Work Section
                          Container(
                            key: navController.communityKey,
                            child: const CommunityView(),
                          ),

                          const _SectionDivider(),

                          // 7. Contact Us & Footer Section
                          Container(
                            key: navController.contactKey,
                            child: const ContactView(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 48.horizontalPadding,
      child: const Divider(
        color: AppColors.darkBorderLight,
        thickness: 1,
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  final MainViewModel mainViewModel;
  final NavigationController navController;

  const _MobileDrawer({
    required this.mainViewModel,
    required this.navController,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkCard,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Padding(
              padding: 24.allPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        text: '< ',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors.primary,
                      ),
                      MyText(
                        text: AppConstants.firstName,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors.textWhite,
                      ),
                      MyText(
                        text: ' />',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontColor: AppColors.primary,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: mainViewModel.closeDrawer,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.darkBorderLight),

            // Navigation Items List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: mainViewModel.navItems.map((item) {
                  return Obx(() {
                    final isActive =
                        navController.activeSection.value == item.section;
                    return ListTile(
                      leading: Icon(
                        item.icon,
                        color: isActive
                            ? AppColors.primary
                            : AppColors.textMuted,
                        size: 20,
                      ),
                      title: MyText(
                        text: item.title,
                        fontSize: 15,
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w500,
                        fontColor: isActive
                            ? AppColors.primary
                            : AppColors.textLight,
                      ),
                      selected: isActive,
                      selectedTileColor:
                          AppColors.primary.withValues(alpha: 0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 4,
                      ),
                      onTap: () => mainViewModel.onNavItemTap(item.section),
                    );
                  });
                }).toList(),
              ),
            ),

            // Drawer Bottom Socials
            Padding(
              padding: 24.allPadding,
              child: Column(
                children: [
                  const Divider(color: AppColors.darkBorderLight),
                  16.verSpace,
                  const SocialIconsRow(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    iconSize: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

