import 'package:get/get.dart';
import 'package:my_portfolio/config/controller/navigation_controller.dart';
import 'package:my_portfolio/config/utils/enum.dart';
import 'package:my_portfolio/features/header/model/header_model.dart';
import 'package:my_portfolio/features/header/repo/header_repo.dart';

class HeaderViewModel extends GetxController {
  final HeaderRepo _repo;

  HeaderViewModel({HeaderRepo? repo}) : _repo = repo ?? HeaderRepo();

  late final HeaderModel headerData;

  @override
  void onInit() {
    super.onInit();
    headerData = _repo.getHeaderData();
  }

  void onChatPressed() {
    NavigationController.to.scrollToSection(SectionType.contact);
  }
}
