import 'package:admin/controllers/LoginController.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:admin/services/google_gmail_api.dart';

import '../../../constants.dart';

class LoginScreen extends StatefulWidget
{

  @override
  StateMVC<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen>
{
  LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 15),
              Text("Flutter Admin Panel"),
              SizedBox(height: 30),
              Container(
                width: 325,
                height: 250,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text("Sign In", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Text("Connect your google account"),
                      Expanded(child: SizedBox(),),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () async 
                        {  
                          final user = await this._controller.signIn(); 
                          if (!user)
                          {
                            ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Sign in failed..."),));
                          }
                          else
                          {
                            GoogleGmailApi.sendMail(new GoogleMail('kadir', 'ulusoy.taha061@hotmail.com', 'tesetsubject', 'test'));
                            Navigator.of(context).pushReplacement
                                (MaterialPageRoute(builder: (BuildContext context) => ChangeNotifierProvider(create: (context) => 
                                
                                    MenuController(), 
                                    child: MainScreen()) 
                                    
                                  ));
                          }
                        },
                      ),
                      SizedBox(height: defaultPadding,)
                    ],
                  )
              )
            ],
          )
        )
      )

    );
  }
}