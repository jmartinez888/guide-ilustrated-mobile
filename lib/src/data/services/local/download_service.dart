import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService {

  Future<String?> download(
    String url,
  ) async {
    const permissionStorage = Permission.storage;
    final status = await permissionStorage.status;
    if (status.isDenied) {
      await permissionStorage.request();
      return _downloadHelper(url);
    } else if (status.isGranted) {
      {
        return _downloadHelper(url);
      }
    }
    return null;
  }

  Future<String?> _downloadHelper(String url) async {
    final result = await FileDownloader.downloadFile(url: url);
    if (result != null) {
      return 'Descarga existosa!';
    } else {
      return null;
    }
  }
}
