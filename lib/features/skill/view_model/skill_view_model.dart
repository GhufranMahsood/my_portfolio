import 'package:get/get.dart';
import 'package:my_portfolio/features/skill/model/skill_model.dart';
import 'package:my_portfolio/features/skill/repo/skill_repo.dart';

class SkillViewModel extends GetxController {
  final SkillRepo _repo;

  SkillViewModel({SkillRepo? repo}) : _repo = repo ?? SkillRepo();

  late final List<TechCategoryModel> categories;

  @override
  void onInit() {
    super.onInit();
    categories = _repo.getTechCategories();
  }
}
