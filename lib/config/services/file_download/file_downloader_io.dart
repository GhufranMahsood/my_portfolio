import 'dart:io';
import 'dart:typed_data';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadFileFromBytes(Uint8List bytes, String fileName) async {
  Directory dir;
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir =
          (await getDownloadsDirectory()) ??
          await getApplicationDocumentsDirectory();
    }
  } catch (_) {
    dir = await getTemporaryDirectory();
  }

  final file = File('${dir.path}/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  await OpenFilex.open(file.path);
}
