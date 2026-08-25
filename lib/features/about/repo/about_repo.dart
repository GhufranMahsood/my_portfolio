import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/about/model/about_model.dart';

class AboutRepo {
  AboutModel getAboutData() {
    return const AboutModel(
      title: AppConstants.aboutTitle,
      heading: AppConstants.aboutHeading,
      quote: AppConstants.aboutQuote,
      bio: AppConstants.aboutBio,
      resumeUrl: AppConstants.resumeUrl,
      collageImages: [
        AppConstants.project1Img,
        AppConstants.project2Img,
        AppConstants.project3Img,
        AppConstants.project4Img,
      ],
    );
  }
}
