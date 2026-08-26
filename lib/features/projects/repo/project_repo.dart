import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/projects/model/project_model.dart';

class ProjectRepo {
  List<ProjectModel> getProjects() {
    return const [
      ProjectModel(
        title: 'StyleHubly - Fashion Store',
        description:
            'A modern, high-performance E-Commerce mobile application with catalog exploration, cart management, and seamless checkout flow.',
        imageAsset: AppConstants.project1Img,
        badgeType: ProjectBadgeType.product,
        actionLinks: [
          ProjectActionLink(
            title: 'Play Store',
            url:
                'https://play.google.com/store/apps/details?id=com.bitbuilders.style_Hublly&pli=1',
            icon: FontAwesomeIcons.googlePlay,
          ),

          ProjectActionLink(
            title: 'App Store',
            url: 'https://apps.apple.com/us/app/style-hubly/id6788476019',
            icon: FontAwesomeIcons.appStore,
          ),
        ],
      ),
      ProjectModel(
        title: 'Devfolio Showcase',
        description:
            'A modern, interactive portfolio application built for cross-platform web and mobile with reactive state and glassmorphic UI.',
        imageAsset: AppConstants.project2Img,
        badgeType: ProjectBadgeType.openSource,
        actionLinks: [
          ProjectActionLink(
            title: 'Web',
            url: 'https://my-portfolio-24cf6.web.app/',
            icon: Icons.language_rounded,
          ),
          ProjectActionLink(
            title: 'GitHub',
            url: 'https://github.com/GhufranMahsood/my_portfolio',
            icon: FontAwesomeIcons.github,
          ),
        ],
      ),
      ProjectModel(
        title: 'Habit Pro - Daily Tracker',
        description:
            'A sleek productivity and habit tracking app with streak analytics, daily reminders, and offline-first database synchronization.',
        imageAsset: AppConstants.project3Img,
        badgeType: ProjectBadgeType.product,
        actionLinks: [
          ProjectActionLink(
            title: 'Live Demo',
            url:
                'https://drive.google.com/file/d/10njVUkL9rftqPOAsigVExOWyy_GuDsWL/view?usp=sharing',
            icon: FontAwesomeIcons.googlePlay,
          ),
          // ProjectActionLink(
          //   title: 'GitHub',
          //   url: 'https://github.com/GhufranMahsood/Habit-Pro',
          //   icon: FontAwesomeIcons.github,
          // ),
        ],
      ),
      ProjectModel(
        title: 'Vox Nebula - Neural Voice Synthesis',
        description:
            'AI-powered Text-to-Speech engine featuring 30+ synthetic voice identities, cinematic live waveform rendering, and studio-grade emotion modulation on iOS & Android.',
        imageAsset: AppConstants.project4Img,
        badgeType: ProjectBadgeType.openSource,
        actionLinks: [
          ProjectActionLink(
            title: 'Live Demo',
            url:
                'https://github.com/GhufranMahsood/Vox-Nebula-AI-Voice-Synthesis',
            icon: Icons.graphic_eq_rounded,
          ),

          ProjectActionLink(
            title: 'GitHub',
            url: 'https://github.com/GhufranMahsood/voice_generator_app',
            icon: FontAwesomeIcons.github,
          ),
        ],
      ),
    ];
  }
}
