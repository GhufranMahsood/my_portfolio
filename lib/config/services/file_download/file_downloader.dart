import 'dart:typed_data';
import 'file_downloader_stub.dart'
    if (dart.library.js_interop) 'file_downloader_web.dart'
    if (dart.library.io) 'file_downloader_io.dart';

class FileDownloader {
  FileDownloader._();

  static Future<void> downloadBytes({
    required Uint8List bytes,
    required String fileName,
  }) async {
    await downloadFileFromBytes(bytes, fileName);
  }
}
