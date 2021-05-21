import 'package:flutter/material.dart';
import 'package:share_a_file/app/theme.dart';

class ShareTitle extends StatelessWidget {
  const ShareTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Text(
        'Share A File',
        style: titleStyle,
      ),
    );
  }
}
