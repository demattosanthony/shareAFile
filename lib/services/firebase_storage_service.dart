import 'dart:html';
// import 'package:firebase/firebase.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';

abstract class FbStorageService {
  Future<String> uploadFile(File file, String fileName);
  String url;
}

class FbStorageServiceImplementation implements FbStorageService {
  Future<String> uploadFile(File file, String fileName) async {
    var result = await FirebaseStorage.instance
        .refFromURL('gs://covid-wedding.appspot.com')
        .child('$fileName${DateTime.now()}')
        .putBlob(file);

    String downloadUrl = await result.ref.getDownloadURL();
    url = downloadUrl.toString();
    return downloadUrl.toString();
  }

  @override
  String url;
}
