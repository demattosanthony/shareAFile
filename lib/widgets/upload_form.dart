import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';
import 'package:share_a_file/widgets/upload_btn.dart';

import 'email_text_field.dart';

class UploadForm extends StatelessWidget {
  final TextEditingController emailContr;
  const UploadForm({Key key, @required this.emailContr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          EmailTextField(emailContr: emailContr),
          UploadButton(),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                sl<EmailManager>().sendEmail();
              },
              child: Text(
                'Send',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                elevation: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
