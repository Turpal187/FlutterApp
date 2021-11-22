import 'package:flutter/cupertino.dart';

import 'package:admin/screens/login/login_screen.dart';
import 'package:admin/screens/main/main_screen.dart';

class NavigationModel 
{

  static List<StatefulWidget> _screens =
  [
    LoginScreen(),
    MainScreen()
  ];

  static List<StatefulWidget> get screens => NavigationModel._screens;
  
}
