import 'dart:io';

import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DownloadMedia {
  final fileDownloader = FileDownloader();
  Future<File? > saveImage(String url) async {
    return FileDownloader.downloadFile(url: url);
  }
}
