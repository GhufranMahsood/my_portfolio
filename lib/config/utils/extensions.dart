import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/local/pref_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utils.dart';

extension NavigaTion on Widget {
  dynamic get navigate => Get.to(this, transition: Transition.fadeIn);
  dynamic get navigateAndRemove => Get.off(this);
  dynamic get replace => Get.offAll(this);
}

extension ContextExtension on BuildContext {
  double get mqWidth => MediaQuery.sizeOf(this).width;
  double get mqHeight => MediaQuery.sizeOf(this).height;
  double get mqPaddingTop => MediaQuery.paddingOf(this).top;
  double get mqPaddingBottom => MediaQuery.paddingOf(this).bottom;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Future<bool> get isPremium => PrefManager().isPremiumUser();
}

extension StringExtension on String {
  dynamic get successSnack => Utils.snackBarMessage(this);
  dynamic get errorSnack => Utils.snackBarErrorMessage(this);
  String get capitalizeFirst => this[0].toUpperCase() + substring(1);
  Future<void> get launchInBrowser async {
    final Uri uri = Uri.parse(this);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      "Could not launch map".errorSnack;
    }
  }
}

extension EmptySpacer on num {
  SizedBox get verSpace => SizedBox(height: toDouble());
  SizedBox get horSpace => SizedBox(width: toDouble());
  Padding get padAll => Padding(padding: EdgeInsets.all(toDouble()));
  Padding get padSymmetricH =>
      Padding(padding: EdgeInsets.symmetric(horizontal: toDouble()));
  Padding get padSymmetricV =>
      Padding(padding: EdgeInsets.symmetric(vertical: toDouble()));
}

extension ColorExtension on Color {
  Color get light => withValues(alpha: 0.5);
  Color get dark => withValues(alpha: 0.9);
}

extension DateTimeExtension on DateTime {
  String timeAgo() {
    final Duration diff = DateTime.now().difference(this);
    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '$day/$month/$year';
  }
}

extension EdgeInsetsExtension on num {
  EdgeInsets get allPadding => EdgeInsets.all(toDouble());
  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());
}
