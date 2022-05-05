import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthApi
{
  static final googleClientId = '258412889672-41562fqhugs1fl25mv44ev5sdcqtd59p.apps.googleusercontent.com';
  static final googleSignIn = GoogleSignIn(clientId: GoogleAuthApi.googleClientId, scopes: ['https://www.googleapis.com/auth/calendar', 'https://mail.google.com/']);
  static Future<GoogleSignInAccount?> login() => GoogleAuthApi.googleSignIn.signIn();
}