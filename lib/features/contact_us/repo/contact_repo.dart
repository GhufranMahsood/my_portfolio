import 'package:intl/intl.dart';
import 'package:my_portfolio/config/utils/app_constants.dart';
import 'package:my_portfolio/features/contact_us/model/contact_model.dart';

class ContactRepo {
  ContactModel getContactData() {
    final now = DateTime.now();
    final monthName = DateFormat('MMMM').format(now);
    final dayNum = DateFormat('d').format(now);
    final weekDay = DateFormat('EEEE').format(now);

    return ContactModel(
      title: AppConstants.contactTitle,
      subtitle: AppConstants.contactSubtitle,
      email: AppConstants.email,
      phone: AppConstants.phone,
      calendarMonth: monthName.isNotEmpty ? monthName : AppConstants.calendarMonth,
      calendarDay: dayNum.isNotEmpty ? dayNum : AppConstants.calendarDay,
      calendarWeekday:
          weekDay.isNotEmpty ? weekDay : AppConstants.calendarWeekday,
      callCta: AppConstants.callCta,
    );
  }
}
