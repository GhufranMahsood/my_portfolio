import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/config/responsive/responsive_layout.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/features/contact_us/view_model/contact_view_model.dart';
import 'package:my_portfolio/widgets/custom_button.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';
import 'package:my_portfolio/widgets/glass_container.dart';
import 'package:my_portfolio/widgets/hover_builder.dart';
import 'package:my_portfolio/widgets/section_header.dart';
import 'package:my_portfolio/widgets/social_icons_row.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(ContactViewModel());
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 64 : (isTablet ? 32 : 20),
            vertical: isDesktop ? 90 : 54,
          ),
          child: Column(
            children: [
              SectionHeader(
                tag: "LET'S CONNECT",
                title: viewModel.contactData.title,
                subtitle: viewModel.contactData.subtitle,
                isCenter: true,
              ),
              SizedBox(height: isDesktop ? 54 : 36),

              // Calendar Card + Contact Methods Box
              Container(
                constraints: const BoxConstraints(maxWidth: 540),
                child: Column(
                  children: [
                    // Calendar Block
                    _CalendarCard(
                      month: viewModel.contactData.calendarMonth,
                      day: viewModel.contactData.calendarDay,
                      weekday: viewModel.contactData.calendarWeekday,
                    ),
                    const SizedBox(height: 32),

                    // Email Card
                    _ContactDetailCard(
                      icon: Icons.mail_outline_rounded,
                      title: 'Email Address',
                      text: viewModel.contactData.email,
                      onTap: viewModel.sendEmail,
                      onCopy: viewModel.copyEmail,
                    ),
                    const SizedBox(height: 14),

                    // Phone Card
                    _ContactDetailCard(
                      icon: Icons.phone_outlined,
                      title: 'Phone / WhatsApp',
                      text: viewModel.contactData.phone,
                      onTap: viewModel.callPhone,
                      onCopy: viewModel.copyPhone,
                    ),
                    const SizedBox(height: 32),

                    // Schedule 15 Min Call Button
                    CustomButton(
                      text: viewModel.contactData.callCta,
                      onPressed: viewModel.bookMeeting,
                      width: double.infinity,
                      height: 54,
                      icon: const Icon(
                        Icons.video_call_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Social Icons Row
                    const SocialIconsRow(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      iconSize: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Bottom Footer
        const FooterWidget(),
      ],
    );
  }
}

class _CalendarCard extends StatelessWidget {
  final String month;
  final String day;
  final String weekday;

  const _CalendarCard({
    required this.month,
    required this.day,
    required this.weekday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          // Month Top Banner with gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Text(
              month.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),

          // Day & Weekday
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFFFFFFF), Color(0xFF21BCFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  child: Text(
                    day,
                    style: GoogleFonts.poppins(
                      fontSize: 54,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  weekday,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactDetailCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final VoidCallback onTap;
  final VoidCallback onCopy;

  const _ContactDetailCard({
    required this.icon,
    required this.title,
    required this.text,
    required this.onTap,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      onTap: onTap,
      builder: (context, isHovered) {
        return GlassContainer(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          borderRadius: 16,
          borderColor: isHovered
              ? AppColors.primary.withValues(alpha: 0.7)
              : AppColors.darkBorder,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isHovered
                      ? AppColors.primary.withValues(alpha: 0.2)
                      : AppColors.darkCardSecondary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isHovered
                        ? AppColors.primary
                        : AppColors.darkBorderLight,
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  color: isHovered ? AppColors.primary : AppColors.textLight,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
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
                      text,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isHovered
                            ? AppColors.textWhite
                            : AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.copy_rounded,
                  size: 16,
                  color: AppColors.textDim,
                ),
                tooltip: 'Copy',
                onPressed: onCopy,
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textDim,
                size: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
