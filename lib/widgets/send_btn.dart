import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';

class SendBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: ElevatedButton(
        onPressed: () async {
          if (sl<EmailManager>().email == "" && sl<EmailManager>().link == "") {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text('Please enter email and select file to share'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'))
                    ],
                  );
                });
          } else {
            BuildContext sendingCtx;
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  sendingCtx = context;
                  return AlertDialog(
                    title: Text('Sending'),
                    content: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CircularProgressIndicator()),
                  );
                });

            int resCode = await sl<EmailManager>().sendEmail();
            if (resCode == 200) {
              Navigator.pop(sendingCtx);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Sent'),
                      content: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 5)),
                        height: 100,
                        width: 100,
                        child: Icon(
                          Icons.check,
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'))
                      ],
                    );
                  });
            } else {
              Navigator.pop(sendingCtx);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Could Not Send'),
                      content: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 5)),
                        height: 100,
                        width: 100,
                        child: Icon(
                          Icons.check,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'))
                      ],
                    );
                  });
            }
          }
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
