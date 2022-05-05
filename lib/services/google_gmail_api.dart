import 'package:admin/models/UserModel.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:admin/services/google_auth_api.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

import 'dart:convert';

class GoogleMail
{
  String recipientName = '';
  String recipientEmail = '';
  String subject = '';
  String message = '';
  GoogleMail(this.recipientName, this.recipientEmail, this.subject, this.message);
}

class GoogleGmailApi
{
  static Future<void> sendMail(GoogleMail mail) async
  {
    final authClient = await GoogleAuthApi.googleSignIn.authenticatedClient(); 
    final gmailApi = new GmailApi(authClient!);

    final messageBuilder = new MessageBuilder();
    messageBuilder.from = [MailAddress(UserModel.user?.displayName, UserModel.user?.email ?? '')];
    messageBuilder.to = [MailAddress(mail.recipientName, mail.recipientEmail)];
    messageBuilder.subject = mail.subject;
    messageBuilder.text = mail.message;

    final message = new Message(raw: base64.encode(utf8.encode(messageBuilder.buildMimeMessage().renderMessage())));
    gmailApi.users.messages.send(message, 'me');
  }
}