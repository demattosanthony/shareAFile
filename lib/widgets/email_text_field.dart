import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key key,
    @required this.emailContr,
  }) : super(key: key);

  final TextEditingController emailContr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 200,
      height: 50,
      child: TextField(
        controller: emailContr,
        onChanged: (String email) {
          sl<EmailManager>().email = email;
        },
        decoration: InputDecoration(
            hintText: 'Email',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(8),
            hintStyle: TextStyle(fontSize: 20, color: Colors.grey[400])),
      ),
    );
  }
}
