import 'package:flutter/material.dart';
import 'package:share_a_file/app/share_page.dart';
import 'package:share_a_file/app/home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case 'sharePage':
        return MaterialPageRoute(builder: (_) => SharePage());
    }
  }
}
