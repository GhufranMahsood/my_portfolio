import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/widgets/my_text.dart';

import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void infoSnack(String msg) {
    Get.snackbar('Info', msg, colorText: Colors.white);
  }

  static void showProgress() {
    Get.dialog(const Center(child: CircularProgressIndicator(strokeWidth: 2)));
  }

  static void hideProgress() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  static void launchURL(
    String url, {
    LaunchMode mode = LaunchMode.platformDefault,
  }) {
    try {
      launchUrl(Uri.parse(url), mode: mode);
    } catch (e) {
      log(e.toString());
    }
  }

  static void snackBarErrorMessage(String message) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 10,
        margin: const EdgeInsets.all(20),
        message: message,
        backgroundColor: Colors.redAccent,
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
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  static Future<void> launchMail(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@microstudio.store',
      query: Utils.encodeQueryParameters(<String, String>{
        'Contact': 'Example Subject & Symbols are allowed!',
      }),
    );
    if (!await launchUrl(emailLaunchUri)) {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: MyText(
              text: "Unable to launch email app",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            content: MyText(
              text:
                  "Please contact us at info@fortifyintel.com for contact information",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: MyText(fontWeight: FontWeight.w500, text: "OK"),
              ),
            ],
          );
        },
      );
      throw 'Could not launch $emailLaunchUri';
    }
  }

  static void hideKeyboard() {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      // ignore: empty_catches
    } catch (e) {}
  }
}
