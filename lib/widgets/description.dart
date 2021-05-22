import 'package:flutter/material.dart';
import 'package:share_a_file/app/theme.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Text(
        'Sending large files between devices can be difficult sometimes. This solution uploads your file to the cloud and sends a download link to the email specified.\n * Make sure to check spam folder *',
        style: descriptionStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
