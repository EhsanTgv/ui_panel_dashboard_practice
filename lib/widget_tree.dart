import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_panel_dashboard_practice/app_bar/app_bar_widget.dart';
import 'package:ui_panel_dashboard_practice/constants.dart';
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
  int currentIndex = 1;

  final List<Widget> _icons = [
    const Icon(Icons.add, size: 30),
    const Icon(Icons.list, size: 30),
    const Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : const AppBarWidget()),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? const PanelLeftPage()
            : currentIndex == 1
                ? const PanelCenterPage()
                : const PanelRightPage(),
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
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : const SizedBox(),
    );
  }
}
