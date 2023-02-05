import 'package:flutter/material.dart';
import 'package:ui_panel_dashboard_practice/app_bar/app_bar_widget.dart';
import 'package:ui_panel_dashboard_practice/drawer/drawer_page.dart';
import 'package:ui_panel_dashboard_practice/panel_center/panel_center_page.dart';
import 'package:ui_panel_dashboard_practice/panel_left/panel_left_page.dart';
import 'package:ui_panel_dashboard_practice/panel_right_page/panel_right_page.dart';
import 'package:ui_panel_dashboard_practice/responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : AppBarWidget()),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const PanelCenterPage(),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
        computer: Row(
          children: const [
            Expanded(child: DrawerPage()),
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(child: PanelRightPage()),
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }
}
