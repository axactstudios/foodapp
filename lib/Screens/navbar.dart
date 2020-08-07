import 'package:flutter/material.dart';
import 'package:foodapp/Classes/my_flutter_app_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dashboard.dart';
import 'more.dart';
import 'my_kitchen.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'home.dart';

import 'package:foodapp/Classes/my_flutter_app_icons.dart';



class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style8,
    );
  }

  List<Widget> _buildScreens() {
    return [Home(), Mykitchen(), DashBoard(), More()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(MyFlutterApp.orderselect_3x_1_),
          title: ("Orders"),
          inactiveColor: khometextcolor2,
          activeColor: khometextcolor1),
      PersistentBottomNavBarItem(
          icon: Icon(MyFlutterApp.mykitchenselect_3x_1),
          title: ("My Kitchen"),
          inactiveColor: khometextcolor2,
          activeColor: khometextcolor1),
      PersistentBottomNavBarItem(
          icon: Icon(MyFlutterApp.dashboardselect_3x_1),
          title: ("Dashboard"),
          inactiveColor: khometextcolor2,
          activeColor: khometextcolor1),
      PersistentBottomNavBarItem(
          icon: Icon(
            MyFlutterApp.moreselect_3x_1,
            size: 20,
          ),
          title: ("More"),
          inactiveColor: khometextcolor2,
          activeColor: khometextcolor1),
    ];
  }
}
