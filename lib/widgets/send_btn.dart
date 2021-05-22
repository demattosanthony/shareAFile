import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';

class SendBtn extends StatelessWidget {
  const SendBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: () {
          sl<EmailManager>().sendEmail();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Send',
            style: TextStyle(fontSize: 22),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          elevation: 10,
        ),
      ),
    );
  }
}
