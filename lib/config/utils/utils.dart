import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/config/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void infoSnack(String msg) {
    Get.snackbar(
      'Info',
      msg,
      colorText: Colors.white,
      backgroundColor: AppColors.darkCard,
      borderColor: AppColors.primary,
      borderWidth: 1,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
    );
  }

  static void showProgress() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary,
        ),
      ),
    );
  }

  static void hideProgress() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  static Future<void> launchURL(
    String url, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) async {
    try {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: mode)) {
        snackBarErrorMessage('Could not open $url');
      }
    } catch (e) {
      log(e.toString());
      snackBarErrorMessage('Error opening link: $e');
    }
  }

  static void copyToClipboard(String text, {String? successMessage}) {
    Clipboard.setData(ClipboardData(text: text));
    snackBarMessage(successMessage ?? 'Copied to clipboard!');
  }

  static void snackBarErrorMessage(String message) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 10,
        margin: const EdgeInsets.all(20),
        message: message,
        backgroundColor: const Color(0xFF991B1B),
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.cancel_outlined, color: Colors.white),
      ),
    );
  }

  static void snackBarMessage(String message) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 10,
        margin: const EdgeInsets.all(20),
        message: message,
        backgroundColor: const Color(0xFF065F46),
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  static Future<void> launchMail(String email, {String? subject, String? body}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters({
        ...?subject != null ? {'subject': subject} : null,
        ...?body != null ? {'body': body} : null,
      }),
    );
    try {
      if (!await launchUrl(emailLaunchUri)) {
        snackBarErrorMessage('Could not open email client.');
      }
    } catch (e) {
      snackBarErrorMessage('Could not open email client.');
    }
  }

  static Future<void> launchPhone(String phone) async {
    final cleanPhone = phone.replaceAll(' ', '').replaceAll('-', '');
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: cleanPhone);
    try {
      if (!await launchUrl(phoneLaunchUri)) {
        snackBarErrorMessage('Could not open dialer.');
      }
    } catch (e) {
      snackBarErrorMessage('Could not open dialer.');
    }
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    if (params.isEmpty) return null;
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  static void hideKeyboard() {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    } catch (_) {}
  }
}
