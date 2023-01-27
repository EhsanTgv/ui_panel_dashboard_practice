import 'package:flutter/material.dart';
import 'package:ui_panel_dashboard_practice/constants.dart';
import 'package:ui_panel_dashboard_practice/widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight,
      ),
      home: WidgetTree(),
    );
  }
}
