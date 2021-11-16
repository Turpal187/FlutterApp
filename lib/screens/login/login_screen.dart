import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../../constants.dart';

class LoginScreen extends StatefulWidget
{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
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
                        onPressed: () {},
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
