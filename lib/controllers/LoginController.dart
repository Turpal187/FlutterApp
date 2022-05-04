import 'package:admin/services/google_auth_api.dart';
import 'package:admin/models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends ChangeNotifier
{
  static final LoginController _taskController = LoginController._internal();
  factory LoginController() { return _taskController; }

  LoginController._internal();

  Future<bool> signIn() async
  {
    final user = await GoogleAuthApi.login();
    if (user == null)
    {
      return false;
    }

    UserModel.write(user);
    return true;
  }
}