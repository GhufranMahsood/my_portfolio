import 'package:get/get.dart';
import 'package:my_portfolio/config/services/file_service.dart';
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

  Future<void> downloadResume() async {
    await FileService.downloadAssetFile(
      assetPath: aboutData.resumePdfPath,
      fileName: aboutData.resumeFileName,
    );
  }
}

