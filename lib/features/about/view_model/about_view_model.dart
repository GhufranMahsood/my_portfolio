import 'package:get/get.dart';
import 'package:my_portfolio/config/services/url_service.dart';
import 'package:my_portfolio/features/about/model/about_model.dart';
import 'package:my_portfolio/features/about/repo/about_repo.dart';

class AboutViewModel extends GetxController {
  final AboutRepo _repo;

  AboutViewModel({AboutRepo? repo}) : _repo = repo ?? AboutRepo();

  late final AboutModel aboutData;

  @override
  void onInit() {
    super.onInit();
    aboutData = _repo.getAboutData();
  }

  void downloadResume() {
    UrlService.openUrl(aboutData.resumeUrl);
  }
}
