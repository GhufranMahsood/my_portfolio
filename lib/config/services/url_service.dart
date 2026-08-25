import 'package:my_portfolio/config/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  UrlService._();

  static Future<void> openUrl(String url) async {
    await Utils.launchURL(url, mode: LaunchMode.externalApplication);
  }

  static Future<void> sendEmail(String email, {String? subject}) async {
    await Utils.launchMail(email, subject: subject);
  }

  static Future<void> dialNumber(String phone) async {
    await Utils.launchPhone(phone);
  }
}
