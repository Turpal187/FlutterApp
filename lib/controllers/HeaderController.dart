import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:admin/models/UserModel.dart';

class HeaderController extends ControllerMVC
{
  static final HeaderController _headerController = HeaderController._internal();
  factory HeaderController() { return _headerController; }

  HeaderController._internal();

  String name()
  {
    final user = UserModel.user;
    if (user == null)
    {
      return "";
    }

    return user.displayName.toString();
  }

  String photo()
  {
    final user = UserModel.user;

    if (user == null)
    {
      return "";
    }

    return user.photoUrl.toString();
  }
}