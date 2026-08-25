import 'package:my_portfolio/features/experience/model/experience_model.dart';

class ExperienceRepo {
  List<ExperienceModel> getExperiences() {
    return const [
      ExperienceModel(
        company: 'Project-Based & Freelance Development',
        role: 'Full Stack Flutter Developer',
        duration: '2025 - Present',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'Supabase',
          'Payment Gateways',
          'CI/CD Pipelines',
          'App Store & Play Store',
        ],
        bulletPoints: [
          'Delivering high-impact custom mobile & cross-platform applications for global and regional clients across diverse business sectors.',
          'Managing the entire product engineering cycle: architecture design, state management, API integration, and cloud infrastructure.',
          'Publishing, optimizing, and maintaining apps on Google Play Store and Apple App Store with continuous updates and fast turnaround times.',
          'Authoring reusable Flutter libraries, responsive UI packages, and clean starter templates.',
        ],
      ),
      ExperienceModel(
        company: 'Dost Logic',
        role: 'Flutter Developer',
        duration: '2023 - 2025',
        technologies: [
          'Flutter',
          'Dart',
          'State Management',
          'REST APIs',
          'Hive & SQLite',
          'Google Maps SDK',
          'Push Notifications',
        ],
        bulletPoints: [
          'Developed production mobile applications with a core focus on offline-first caching mechanisms using Hive and SQLite.',
          'Integrated real-time push notifications, geolocation features, and interactive maps via Google Maps SDK.',
          'Optimized rendering performance, minimized widget rebuilds, and reduced app bundle sizes for smooth 60 FPS UX.',
          'Collaborated closely with backend engineers and QA teams in Agile sprint workflows to ensure timely deliverables.',
        ],
      ),
      ExperienceModel(
        company: 'Shaheen Devs',
        role: 'Associate Flutter Developer',
        duration: '2021 - 2023',
        technologies: [
          'Flutter',
          'Dart',
          'Bloc / Provider',
          'REST APIs',
          'Firebase',
          'Git & GitHub',
          'Play Store Console',
        ],
        bulletPoints: [
          'Engineered cross-platform Android & iOS applications using Flutter and Dart from the ground up.',
          'Applied Clean Architecture principles and decoupled state management using BLoC and Provider.',
          'Integrated RESTful APIs, third-party libraries, and Firebase authentication & database services.',
          'Assisted in publishing production builds to Google Play Store and maintaining version control with Git.',
        ],
      ),
    ];
  }
}
