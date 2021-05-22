import 'dart:html';

import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';
import 'package:share_a_file/widgets/file_drop.dart';
import 'package:share_a_file/widgets/send_btn.dart';

import 'email_text_field.dart';

class UploadForm extends StatefulWidget {
  final TextEditingController emailContr;
  const UploadForm({Key key, @required this.emailContr}) : super(key: key);

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          EmailTextField(emailContr: widget.emailContr),
          FileDrop(),
          SendBtn()
        ],
      ),
    );
  }
}

