import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/about/repo/about_repo.dart';

void main() {
  test('AboutRepo returns resume pdf path and filename', () {
    final repo = AboutRepo();
    final data = repo.getAboutData();

    expect(data.resumePdfPath, AppConstants.resumePdf);
    expect(data.resumeFileName, AppConstants.resumeFileName);
    expect(data.resumePdfPath.isNotEmpty, true);
  });
}
