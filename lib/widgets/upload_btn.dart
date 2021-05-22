import 'dart:html';

import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';

class UploadButton extends StatefulWidget {
  const UploadButton({
    Key key,
  }) : super(key: key);

  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  String _fileName = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: _fileName == ""
          ? TextButton(
              onPressed: () async {
                InputElement uploadInput = FileUploadInputElement();
                uploadInput.click();

                uploadInput.onChange.listen((e) async {
                  final files = uploadInput.files;
                  if (files.length == 1) {
                    FileReader reader = FileReader();
                    reader.readAsDataUrl(uploadInput.files[0]);
                    reader.onLoadEnd.listen((e) async {
                      File f = uploadInput.files[0];

                      
                      sl<EmailManager>().fileToUpload = f;

                      setState(() {
                        _fileName = f.name;
                      });
                    });
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Upload File',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
            )
          : Text(_fileName),
    );
  }
}
