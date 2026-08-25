import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:my_portfolio/features/skill/model/skill_model.dart';

class SkillRepo {
  List<TechCategoryModel> getTechCategories() {
    return const [
      TechCategoryModel(
        title: 'Mobile development',
        skills: [
          SkillItem(
            name: 'Flutter',
            icon: Icons.flutter_dash,
            color: Color(0xFF02569B),
          ),
          SkillItem(
            name: 'Dart',
            icon: Icons.code,
            color: Color(0xFF0175C2),
          ),
        ],
      ),
      TechCategoryModel(
        title: 'Web development',
        skills: [
          SkillItem(
            name: 'HTML',
            icon: FontAwesomeIcons.html5,
            color: Color(0xFFE34F26),
          ),
          SkillItem(
            name: 'CSS',
            icon: FontAwesomeIcons.css3Alt,
            color: Color(0xFF1572B6),
          ),
          SkillItem(
            name: 'Bootstrap',
            icon: FontAwesomeIcons.bootstrap,
            color: Color(0xFF7952B3),
          ),
          SkillItem(
            name: 'Javascript',
            icon: FontAwesomeIcons.js,
            color: Color(0xFFF7DF1E),
          ),
        ],
      ),
      TechCategoryModel(
        title: 'Server side',
        skills: [
          SkillItem(
            name: 'flask-restful',
            icon: FontAwesomeIcons.python,
            color: Color(0xFF3776AB),
          ),
          SkillItem(
            name: 'Node.js',
            icon: FontAwesomeIcons.nodeJs,
            color: Color(0xFF339933),
          ),
          SkillItem(
            name: 'Express.js',
            icon: Icons.developer_mode,
            color: Color(0xFF808080),
          ),
          SkillItem(
            name: 'REST APIs',
            icon: Icons.api_rounded,
            color: AppColors.primary,
          ),
        ],
      ),
      TechCategoryModel(
        title: 'Databases',
        skills: [
          SkillItem(
            name: 'Firebase',
            icon: FontAwesomeIcons.fire,
            color: Color(0xFFFFCA28),
          ),
          SkillItem(
            name: 'MongoDB',
            icon: FontAwesomeIcons.leaf,
            color: Color(0xFF47A248),
          ),
          SkillItem(
            name: 'SQL',
            icon: FontAwesomeIcons.database,
            color: Color(0xFF00758F),
          ),
          SkillItem(
            name: 'Postgres',
            icon: FontAwesomeIcons.database,
            color: Color(0xFF336791),
          ),
        ],
      ),
      TechCategoryModel(
        title: 'Version controlling & management',
        skills: [
          SkillItem(
            name: 'Git & GitHub',
            icon: FontAwesomeIcons.github,
            color: Color(0xFFF05032),
          ),
          SkillItem(
            name: 'Jira',
            icon: FontAwesomeIcons.jira,
            color: Color(0xFF0052CC),
          ),
          SkillItem(
            name: 'Trello',
            icon: FontAwesomeIcons.trello,
            color: Color(0xFF0079BF),
          ),
          SkillItem(
            name: 'Notion',
            icon: FontAwesomeIcons.noteSticky,
            color: Color(0xFF000000),
          ),
        ],
      ),
      TechCategoryModel(
        title: 'App Deployment & Store Release',
        skills: [
          SkillItem(
            name: 'Google Play Store Console',
            icon: FontAwesomeIcons.googlePlay,
            color: Color(0xFF00C3FF),
          ),
          SkillItem(
            name: 'Apple App Store Connect',
            icon: FontAwesomeIcons.appStoreIos,
            color: Color(0xFF007AFF),
          ),
          SkillItem(
            name: 'TestFlight & Internal Testing',
            icon: Icons.flight_takeoff_rounded,
            color: Color(0xFF21BCFF),
          ),
          SkillItem(
            name: 'CI/CD & Fastlane',
            icon: Icons.rocket_launch_rounded,
            color: Color(0xFF00E5FF),
          ),
        ],
      ),
      TechCategoryModel(
        title: 'UI/UX Design',
        skills: [
          SkillItem(
            name: 'Figma',
            icon: FontAwesomeIcons.figma,
            color: Color(0xFFF24E1E),
          ),
          SkillItem(
            name: 'Adobe XD',
            icon: Icons.design_services,
            color: Color(0xFFFF61F6),
          ),
        ],
      ),
    ];
  }
}
