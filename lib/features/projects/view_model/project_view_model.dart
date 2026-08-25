import 'package:get/get.dart';
import 'package:my_portfolio/config/services/url_service.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/projects/model/project_model.dart';
import 'package:my_portfolio/features/projects/repo/project_repo.dart';

enum ProjectFilter { all, openSource, product, package }

class ProjectViewModel extends GetxController {
  final ProjectRepo _repo;

  ProjectViewModel({ProjectRepo? repo}) : _repo = repo ?? ProjectRepo();

  late final List<ProjectModel> allProjects;
  final Rx<ProjectFilter> activeFilter = ProjectFilter.all.obs;

  @override
  void onInit() {
    super.onInit();
    allProjects = _repo.getProjects();
  }

  List<ProjectModel> get filteredProjects {
    switch (activeFilter.value) {
      case ProjectFilter.all:
        return allProjects;
      case ProjectFilter.openSource:
        return allProjects
            .where((p) => p.badgeType == ProjectBadgeType.openSource)
            .toList();
      case ProjectFilter.product:
        return allProjects
            .where((p) => p.badgeType == ProjectBadgeType.product)
            .toList();
      case ProjectFilter.package:
        return allProjects
            .where((p) => p.actionLinks.any((l) => l.title.contains('Package')))
            .toList();
    }
  }

  void setFilter(ProjectFilter filter) {
    activeFilter.value = filter;
  }

  void openActionLink(String url) {
    UrlService.openUrl(url);
  }

  void seeMoreProjects() {
    UrlService.openUrl('${AppConstants.githubUrl}?tab=repositories');
  }
}
