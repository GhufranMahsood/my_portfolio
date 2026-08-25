import 'package:flutter/material.dart';
import 'package:my_portfolio/config/utils/enum.dart';
import 'package:my_portfolio/features/main/model/main_nav_item.dart';

class MainRepo {
  List<MainNavItem> getNavItems() {
    return const [
      MainNavItem(
        title: 'Home',
        section: SectionType.header,
        icon: Icons.home_rounded,
      ),
      MainNavItem(
        title: 'About',
        section: SectionType.about,
        icon: Icons.person_rounded,
      ),
      MainNavItem(
        title: 'Tech',
        section: SectionType.tech,
        icon: Icons.code_rounded,
      ),
      MainNavItem(
        title: 'Projects',
        section: SectionType.projects,
        icon: Icons.work_outline_rounded,
      ),
      MainNavItem(
        title: 'Experience',
        section: SectionType.experience,
        icon: Icons.history_edu_rounded,
      ),
      MainNavItem(
        title: 'Education',
        section: SectionType.community,
        icon: Icons.school_rounded,
      ),
      MainNavItem(
        title: 'Contact',
        section: SectionType.contact,
        icon: Icons.mail_outline_rounded,
      ),
    ];
  }
}
