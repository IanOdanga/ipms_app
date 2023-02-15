import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ipms_app/Screens/home_screen.dart';
import 'package:ipms_app/utils/header_widget.dart';
import 'package:ipms_app/utils/theme_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
              child: Container( 
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, fontFamily: "ubuntu"),
                    ),
                    const Text(
                      'Signin into your account',
                      style: TextStyle(color: Colors.grey, fontFamily: "ubuntu"),
                    ),
                    const SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),style: TextStyle(fontFamily: "ubuntu"),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),style: TextStyle(fontFamily: "ubuntu"),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  //Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                },
                                child: const Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Sign In'.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Don\'t have an account? ", style: TextStyle(fontFamily: "ubuntu")),
                                    TextSpan(
                                      text: "Create",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "ubuntu", color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}