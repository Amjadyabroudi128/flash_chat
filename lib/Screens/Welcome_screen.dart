import 'package:flutter/material.dart';

import '../components/RoundedButton.dart';
import 'Login_screen.dart';
import 'Registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync:this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'login',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoginScreen();
                },),);
              },
            ),
            RoundedButton(
              title: 'register',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return RegistrationScreen();
                },),);
              },
            ),
          ],
        ),
      ),
    );
  }
}