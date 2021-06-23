import 'dart:html';

import 'package:share_a_file/locator.dart';
import 'package:share_a_file/services/firebase_storage_service.dart';
import 'package:share_a_file/services/twillo_service.dart';

class EmailManager {
  String email = "";
  String link = "";
  File fileToUpload;

  Future<int> sendEmail() async {
    link = await sl<FbStorageService>()
        .uploadFile(fileToUpload, fileToUpload.name);
    return await sl<TwilloService>().sendEmail(email, link);
  }
}
