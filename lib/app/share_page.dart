import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/services/firebase_storage_service.dart';
import 'package:share_a_file/services/twillo_service.dart';

class SharePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Share Page')),
          ),
          FloatingActionButton(
              onPressed: () {
                String url = sl<FbStorageService>().url;
                sl<TwilloService>().sendEmail(_controller.text, url);
              },
              child: Icon(Icons.send))
        ],
      ),
    );
  }
}
