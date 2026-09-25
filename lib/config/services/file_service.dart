import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:my_portfolio/config/services/file_download/file_downloader.dart';
import 'package:my_portfolio/config/utils/utils.dart';

class FileService {
  FileService._();

  static Future<void> downloadAssetFile({
    required String assetPath,
    required String fileName,
  }) async {
    try {
      Utils.showProgress();
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await FileDownloader.downloadBytes(bytes: bytes, fileName: fileName);
      Utils.hideProgress();
      Utils.snackBarMessage('Resume downloaded successfully!');
    } catch (e, stack) {
      log('Error downloading asset file: $e', stackTrace: stack);
      Utils.hideProgress();
      Utils.snackBarErrorMessage('Failed to download resume: $e');
    }
  }
}
