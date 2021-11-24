import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthApi
{
  static final _googleClientId = '258412889672-41562fqhugs1fl25mv44ev5sdcqtd59p.apps.googleusercontent.com';
  static final _googleSignIn = GoogleSignIn(clientId: GoogleAuthApi._googleClientId, scopes: ['https://www.googleapis.com/auth/calendar']);
  static Future<GoogleSignInAccount?> login() => GoogleAuthApi._googleSignIn.signIn();
}