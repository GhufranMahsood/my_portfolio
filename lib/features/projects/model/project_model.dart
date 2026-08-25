enum ProjectBadgeType { openSource, product }

class ProjectModel {
  final String title;
  final String description;
  final String imageAsset;
  final ProjectBadgeType badgeType;
  final List<ProjectActionLink> actionLinks;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.badgeType,
    required this.actionLinks,
  });
}

class ProjectActionLink {
  final String title;
  final String url;
  final dynamic icon;

  const ProjectActionLink({
    required this.title,
    required this.url,
    required this.icon,
  });
}
