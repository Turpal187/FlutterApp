import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:admin/models/NavigationModel.dart';
import 'package:flutter/cupertino.dart';

class NavigationController extends ControllerMVC {

  static final NavigationController _navigationController = NavigationController._internal();

  factory NavigationController()
  {
    return _navigationController;
  }

  NavigationController._internal();

  static StatefulWidget get loginScreen => NavigationModel.screens[0];
  static StatefulWidget get mainScreen => NavigationModel.screens[1];

}