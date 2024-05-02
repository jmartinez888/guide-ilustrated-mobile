/* import 'dart:io';

import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:species/src/domain/either.dart';

class DownloadMedia {
  final fileDownloader = FileDownloader();
  final permissionStorage = Permission.storage;

  Future<bool> downloadMedia(String url) async {
    final status = await permissionStorage.status;
    if (status.isDenied) {
      await permissionStorage.request();
    } else if (status.isGranted) {
      {
        FileDownloader.downloadFile(
          url: url,
          onDownloadError: (error) => false,
          onDownloadCompleted: (progress) => true,
          onProgress: (name, progress) => setState(() => _progress = progress),
        );
      }
    }
  }
}
 */