import 'package:flutter/material.dart' hide Router;

import 'package:share_a_file/locator.dart';
import 'router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setUpLocator();
  setPathUrlStrategy();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // routeInformationParser: VxInformationParser(),
    // routerDelegate: VxNavigator(routes: {
    //   '/': (_, __) => MaterialPage(child: UploadFilePage()),
    //   'sharePage': (_, __) => MaterialPage(child: SharePage())
    // }),
    onGenerateRoute: Router.generateRoute,
    initialRoute: '/',
  ));
}
