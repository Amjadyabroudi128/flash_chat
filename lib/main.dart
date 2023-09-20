import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Home_Screen.dart';
import 'Screens/Login_screen.dart';
import 'Screens/chat_screen.dart';
import 'screens/Registration_Screen.dart';
import 'screens/Welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( flashChat());
}

class flashChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),


      },
    );
  }
}
