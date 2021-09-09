import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qsnichdev/Provider/auth_provider.dart';
import 'package:qsnichdev/Screens/AuthScreen/register.dart';

import '../home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: isLoading == false
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: "เลขบัตรประจำตัวประชาชน"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "รหัสผ่าน"),
                  ),
                  FlatButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text("Log In ")),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Don't have an account? Register "),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //Social Auth Buttons
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            //Sign In with google
                            AuthClass()
                                .signWithGoogle()
                                .then((UserCredential value) {
                              final displayName = value.user.displayName;

                              print(displayName);

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false);
                            });
                          },
                          child: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.all(10),
                              child: Text("Continue with Google"))),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthClass()
                              .signInWithFacebook()
                              .then((UserCredential value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          });
                        },
                        child: Container(
                          color: Colors.blue,
                          padding: const EdgeInsets.all(10),
                          child: Text("Continue with facebook"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
