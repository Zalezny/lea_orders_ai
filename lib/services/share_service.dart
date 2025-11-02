import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

@lazySingleton
class ShareService {
  Future<void> shareJson({required String jsonContent, required String fileName}) async {
    final bytes = utf8.encode(jsonContent);
    final xfile = XFile.fromData(bytes, mimeType: 'application/json', name: fileName);
    await SharePlus.instance.share(ShareParams(files: [xfile], text: 'Plik JSON z wynikiem zamówienia'));
  }
}
