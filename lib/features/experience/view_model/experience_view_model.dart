import 'package:get/get.dart';
import 'package:my_portfolio/features/experience/model/experience_model.dart';
import 'package:my_portfolio/features/experience/repo/experience_repo.dart';

class ExperienceViewModel extends GetxController {
  final ExperienceRepo _repo;

  ExperienceViewModel({ExperienceRepo? repo})
      : _repo = repo ?? ExperienceRepo();

  late final List<ExperienceModel> experiences;
  final RxInt expandedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    experiences = _repo.getExperiences();
  }

  void toggleExpanded(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1; // collapse
    } else {
      expandedIndex.value = index; // expand
    }
  }
}
