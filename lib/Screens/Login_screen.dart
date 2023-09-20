import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syrian_ecipes/Screens/Registration_screen.dart';

import '../Methods.dart';
import '../components/constants.dart';
import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Text(
              'Login',
              style: const TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            TextFormField (
              textAlign: TextAlign.center,
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
              ),
            ),
            TextField (
              obscureText: _isObscure,
              textAlign: TextAlign.center,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            customButton(size),
            SizedBox(
              height: size.height / 40,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => RegistrationScreen())),
              child: Text(
                "Create Account",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          logIn(emailController.text, passwordController.text).then((user) {
            if (user != null) {
              print("Login Sucessfull");
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else {
              print("Login Failed");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please fill form correctly");
        }
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlueAccent,
          ),
          alignment: Alignment.center,
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}