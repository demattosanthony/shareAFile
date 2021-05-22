// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:share_a_file/widgets/description.dart';
import 'package:share_a_file/widgets/title.dart';
import 'package:share_a_file/widgets/upload_form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShareTitle(),
              Description(),
              UploadForm(
                emailContr: emailController,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
