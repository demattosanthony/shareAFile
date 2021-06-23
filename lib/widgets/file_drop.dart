import 'dart:html';

import 'package:dotted_border/dotted_border.dart';
import 'package:drop_zone/drop_zone.dart';
import 'package:flutter/material.dart';
import 'package:share_a_file/locator.dart';
import 'package:share_a_file/managers/EmailManager.dart';

class FileDrop extends StatefulWidget {
  @override
  _FileDropState createState() => _FileDropState();
}

class _FileDropState extends State<FileDrop> {
  bool isHovering = false;
  String fileName = "";
  @override
  Widget build(BuildContext context) {
    return DropZone(
        onDragEnter: () {
          print('entered');
          setState(() {
            isHovering = true;
          });
        },
        onDragExit: () {
          setState(() {
            isHovering = false;
          });
        },
        onDrop: (List<File> files) {
          print('files dropped');
          print(files);
          sl<EmailManager>().fileToUpload = files[0];
          setState(() {
            fileName = files[0].name;
            isHovering = false;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(8),
          width: 600,
          height: 300,
          child: Stack(
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  elevation: 10,
                  child: Container()),
              Positioned(
                  top: 30,
                  left: 30,
                  right: 30,
                  bottom: 30,
                  child: DottedBorder(
                    radius: Radius.circular(15),
                    borderType: BorderType.RRect,
                    dashPattern: [8],
                    color: Colors.grey,
                    child: Container(
                      color: isHovering ? Color(0xffE4EEFC) : Colors.white,
                      width: 6000,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 110,
                              width: 110,
                              margin: EdgeInsets.only(top: 20),
                              child: Image.network(
                                  'https://share-a-file.web.app/assets/assets/images/folder.png')),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: EdgeInsets.only(top: 20),
                            child: fileName == ""
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Drag File Here or ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.grab,
                                        child: GestureDetector(
                                          onTap: () {
                                            InputElement uploadInput =
                                                FileUploadInputElement();
                                            uploadInput.click();

                                            uploadInput.onChange
                                                .listen((e) async {
                                              final files = uploadInput.files;
                                              if (files.length == 1) {
                                                FileReader reader =
                                                    FileReader();
                                                reader.readAsDataUrl(
                                                    uploadInput.files[0]);
                                                reader.onLoadEnd
                                                    .listen((e) async {
                                                  File f = uploadInput.files[0];

                                                  sl<EmailManager>()
                                                      .fileToUpload = f;

                                                  setState(() {
                                                    fileName = f.name;
                                                  });
                                                });
                                              }
                                            });
                                          },
                                          child: Text(
                                            'Browse',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        sl<EmailManager>().fileToUpload.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
