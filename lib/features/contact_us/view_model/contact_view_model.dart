import 'package:get/get.dart';
import 'package:my_portfolio/config/services/url_service.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/config/utils/utils.dart';
import 'package:my_portfolio/features/contact_us/model/contact_model.dart';
import 'package:my_portfolio/features/contact_us/repo/contact_repo.dart';

class ContactViewModel extends GetxController {
  final ContactRepo _repo;

  ContactViewModel({ContactRepo? repo}) : _repo = repo ?? ContactRepo();

  late final ContactModel contactData;

  @override
  void onInit() {
    super.onInit();
    contactData = _repo.getContactData();
  }

  void sendEmail() {
    UrlService.sendEmail(
      contactData.email,
      subject: "Portfolio Inquiry - Collaboration",
    );
  }

  void copyEmail() {
    Utils.copyToClipboard(contactData.email, successMessage: 'Email copied!');
  }

  void callPhone() {
    UrlService.dialNumber(contactData.phone);
  }

  void copyPhone() {
    Utils.copyToClipboard(
      contactData.phone,
      successMessage: 'Phone number copied!',
    );
  }

  void bookMeeting() {
    UrlService.openUrl(AppConstants.calendlyUrl);
  }
}
