import 'dart:io';

import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
  
}

class _MainScreenState extends State<MainScreen> {

  StatefulWidget _currentScreen = new DashboardScreen();
  
  void _setCurrentScreen(var screen) {

    setState(() {
      
      this._currentScreen = screen;

    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenu(_setCurrentScreen),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(_setCurrentScreen),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: this._currentScreen,
              ),
            ],
          ),
        ),
      );
  }
}
