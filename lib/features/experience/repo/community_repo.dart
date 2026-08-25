import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/features/experience/model/community_model.dart';

class CommunityRepo {
  List<CommunityModel> getCommunityData() {
    return const [
      CommunityModel(
        title: 'Gomal University, Dera Ismail Khan',
        role: 'Bachelor of Science in Computer Science (BSCS)',
        duration: '2019 - 2023',
        description:
            'Graduated with a solid academic foundation in Computer Science, mastering Object-Oriented Programming (OOP), Data Structures & Algorithms (DSA), Database Systems, and Software Engineering. Focused on Mobile Application Engineering for graduation research and projects.',
        icon: Icons.school_rounded,
        brandColor: AppColors.primary,
      ),
      CommunityModel(
        title: 'Flutter & Cross-Platform Specialization',
        role: 'Professional Software Track',
        duration: '2021 - Present',
        description:
            'Dedicated full-time to advanced mobile architecture, reactive state management (BLoC / Provider), clean layered patterns, REST API integrations, and continuous deployment for Android and iOS platforms.',
        icon: Icons.flutter_dash,
        brandColor: Color(0xFF00E5FF),
      ),
      CommunityModel(
        title: 'Tech Community & Open Source',
        role: 'Community Member & Contributor',
        duration: '2021 - Present',
        description:
            'Actively participating in developer circles and Flutter communities. Collaborating on open-source repositories, sharing knowledge, and continuously exploring emerging mobile and cloud technologies.',
        icon: FontAwesomeIcons.github,
        brandColor: Color(0xFF818CF8),
      ),
    ];
  }
}
