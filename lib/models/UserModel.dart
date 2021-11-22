import 'package:google_sign_in/google_sign_in.dart';

class UserModel
{
  static GoogleSignInAccount? _user;
  static GoogleSignInAccount? get user => UserModel._user;
  static void write(GoogleSignInAccount? user) => UserModel._user = user;
}