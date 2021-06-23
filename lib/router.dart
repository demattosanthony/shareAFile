import 'package:flutter/material.dart';
import 'package:share_a_file/app/home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
