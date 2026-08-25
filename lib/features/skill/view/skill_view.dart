import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/utils.dart';
import 'package:my_portfolio/features/skill/view_model/skill_view_model.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/section_header.dart';
import 'package:my_portfolio/widgets/tech_chip.dart';

class SkillView extends StatelessWidget {
  const SkillView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(SkillViewModel());
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
            tag: 'SKILLS & TOOLS',
            title: AppConstants.techTitle,
            subtitle: AppConstants.techSubtitle,
            isCenter: true,
          ),
          SizedBox(height: isDesktop ? 60 : 40),

          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: _TechCategoriesGrid(viewModel: viewModel),
                ),
                const SizedBox(width: 48),
                const Expanded(
                  flex: 5,
                  child: _InteractiveCodeStudio(),
                ),
              ],
            )
          else
            Column(
              children: [
                _TechCategoriesGrid(viewModel: viewModel),
                const SizedBox(height: 48),
                const _InteractiveCodeStudio(),
              ],
            ),
        ],
      ),
    );
  }
}

class _TechCategoriesGrid extends StatelessWidget {
  final SkillViewModel viewModel;

  const _TechCategoriesGrid({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: viewModel.categories.map((category) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GlassContainer(
            padding: const EdgeInsets.all(18),
            borderRadius: 16,
            borderColor: AppColors.darkBorder,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 16,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      category.title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textLight,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: category.skills.map((skill) {
                    return TechChip(
                      label: skill.name,
                      icon: skill.icon != null
                          ? (skill.icon is IconData
                              ? Icon(
                                  skill.icon as IconData,
                                  size: 14,
                                  color: skill.color ?? AppColors.primary,
                                )
                              : FaIcon(
                                  skill.icon,
                                  size: 14,
                                  color: skill.color ?? AppColors.primary,
                                ))
                          : null,
                      color: skill.color,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _InteractiveCodeStudio extends StatelessWidget {
  const _InteractiveCodeStudio();

  @override
  Widget build(BuildContext context) {
    const codeSnippet = '''// Senior Flutter Engineer Architecture
class FlutterEngineer {
  final String name = "${AppConstants.name}";
  final String status = "Available for High-Impact Projects";
  final List<String> coreCompetencies = [
    "Clean Architecture & Modular Design",
    "Flutter, Dart & Cross-Platform UI",
    "flutter_bloc & Reactive State Management",
    "Firebase, Supabase & RESTful APIs",
    "CI/CD with GitHub Actions & DevOps"
  ];

  Future<void> shipMasterpiece() async {
    await buildScalableApp(quality: 1.0, fps: 60);
    print("🚀 Deployed to App Store & Play Store seamlessly!");
  }
}''';

    return GlassContainer(
      padding: EdgeInsets.zero,
      borderRadius: 20,
      borderColor: AppColors.primary.withValues(alpha: 0.4),
      backgroundColor: AppColors.darkCard.withValues(alpha: 0.95),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // macOS Styled Window Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.darkCardSecondary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(19)),
            ),
            child: Row(
              children: [
                // Window Dots
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF5F56),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFBD2E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27C93F),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // File Tab
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.darkCard,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.darkBorder, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.flutter_dash, size: 14, color: AppColors.primary),
                      const SizedBox(width: 6),
                      Text(
                        'engineer_profile.dart',
                        style: GoogleFonts.firaCode(
                          fontSize: 12,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Copy Code Action
                IconButton(
                  icon: const Icon(Icons.copy_rounded, size: 16, color: AppColors.textMuted),
                  tooltip: 'Copy Snippet',
                  onPressed: () {
                    Utils.copyToClipboard(codeSnippet, successMessage: 'Code copied to clipboard!');
                  },
                ),
              ],
            ),
          ),

          // Code Body
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _codeLine('1', 'class ', const Color(0xFFE5C07B), 'FlutterEngineer ',
                    const Color(0xFF61AFEF), '{', const Color(0xFFABB2BF)),
                const SizedBox(height: 5),
                _codeLine('2', '  final String ', const Color(0xFFE5C07B),
                    'name = ', const Color(0xFFABB2BF), '"${AppConstants.name}";', const Color(0xFF98C379)),
                const SizedBox(height: 5),
                _codeLine('3', '  final String ', const Color(0xFFE5C07B),
                    'status = ', const Color(0xFFABB2BF), '"Available for Projects";', const Color(0xFF98C379)),
                const SizedBox(height: 5),
                _codeLine('4', '  final List<String> ', const Color(0xFFE5C07B),
                    'specialties = [', const Color(0xFFABB2BF), '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('5', '    "Clean Architecture",', const Color(0xFF98C379), '', Colors.transparent, '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('6', '    "Bloc & Reactive State",', const Color(0xFF98C379), '', Colors.transparent, '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('7', '    "60 FPS Smooth UI",', const Color(0xFF98C379), '', Colors.transparent, '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('8', '  ];', const Color(0xFFABB2BF), '', Colors.transparent, '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('9', '  Future<void> ', const Color(0xFFE5C07B),
                    'buildMasterpiece() ', const Color(0xFF61AFEF), 'async {', const Color(0xFFABB2BF)),
                const SizedBox(height: 5),
                _codeLine('10', '    await deploy(', const Color(0xFFABB2BF),
                    'quality: 100%, performance: "60 FPS");', const Color(0xFF98C379), '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('11', '  }', const Color(0xFFABB2BF), '', Colors.transparent, '', Colors.transparent),
                const SizedBox(height: 5),
                _codeLine('12', '}', const Color(0xFFABB2BF), '', Colors.transparent, '', Colors.transparent),
              ],
            ),
          ),

          // Bottom Quick Highlights
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.darkCardSecondary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(19)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _miniBadge(Icons.flutter_dash, 'Cross-Platform', AppColors.primary),
                _miniBadge(Icons.speed_rounded, 'High Performance', const Color(0xFF00E5FF)),
                _miniBadge(Icons.auto_awesome_rounded, 'Pixel Perfect', const Color(0xFFA855F7)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _codeLine(
    String lineNum,
    String part1,
    Color color1,
    String part2,
    Color color2,
    String part3,
    Color color3,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 26,
          child: Text(
            lineNum,
            style: GoogleFonts.firaCode(
              fontSize: 12,
              color: AppColors.textDim,
            ),
          ),
        ),
        Expanded(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: GoogleFonts.firaCode(fontSize: 12),
              children: [
                TextSpan(text: part1, style: TextStyle(color: color1)),
                TextSpan(text: part2, style: TextStyle(color: color2)),
                TextSpan(text: part3, style: TextStyle(color: color3)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _miniBadge(IconData icon, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textLight,
          ),
        ),
      ],
    );
  }
}
