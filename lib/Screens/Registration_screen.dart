import 'package:flutter/material.dart';
import '../Methods.dart';
import '../components/RoundedButton.dart';
import '../components/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'Home_Screen.dart';
import 'Login_screen.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
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
              height: size.height / 20,
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Text(
              'Register here ',
              style: const TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              height: size.height / 20,
            ),
            TextField (
                textAlign: TextAlign.center,
                controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            TextField (
              textAlign: TextAlign.center,
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
              ),
            ),
            SizedBox(
              height: size.height / 50,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
        if (nameController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          createAccount(nameController.text, emailController.text, passwordController.text).then((user) {
            if (user != null) {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            } else {
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please enter Fields");
        }
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            "Create Account",
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