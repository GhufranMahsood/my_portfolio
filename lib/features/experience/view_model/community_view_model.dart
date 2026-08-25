import 'package:get/get.dart';
import 'package:my_portfolio/features/experience/model/community_model.dart';
import 'package:my_portfolio/features/experience/repo/community_repo.dart';

class CommunityViewModel extends GetxController {
  final CommunityRepo _repo;

  CommunityViewModel({CommunityRepo? repo}) : _repo = repo ?? CommunityRepo();

  late final List<CommunityModel> communities;

  @override
  void onInit() {
    super.onInit();
    communities = _repo.getCommunityData();
  }
}
