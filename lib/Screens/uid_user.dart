import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qsnichdev/Provider/auth_provider.dart';
import 'package:qsnichdev/Screens/AuthScreen/login.dart';

class UidPage extends StatefulWidget {
  @override
  _UidPageState createState() => _UidPageState();
}

class _UidPageState extends State<UidPage> {
  String user = FirebaseAuth.instance.currentUser.email == null
      ? FirebaseAuth.instance.currentUser.phoneNumber
      : FirebaseAuth.instance.currentUser.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                //sign Out User
                AuthClass().signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              })
        ],
      ),
      body: Center(
        child: Text("Email $user"),
      ),
    );
  }
}
