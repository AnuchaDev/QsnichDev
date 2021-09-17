import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qsnichdev/Provider/auth_provider.dart';
import 'package:qsnichdev/Screens/AuthScreen/register.dart';
import 'package:qsnichdev/Screens/menu.dart';
import 'package:qsnichdev/Screens/myinfo.dart';

import '../uid_user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading == false
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 70),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'เลขบัตรประจำตัวประชาชน',
                      icon: Icon(Icons.account_box),
                    ),
                    onSaved: null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'รหัสผ่าน',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onSaved: null,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Menu_Page()));
                      },
                      child: Text('เข้าสู่ระบบ',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                                    builder: (context) => UidPage()),
                                (route) => false);
                          });
                        },
                        child: FlatButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://cdn.discordapp.com/attachments/834620062090133543/836821196577964073/search.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'เข้าสู่ระบบด้วย Google',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthClass()
                              .signInWithFacebook()
                              .then((UserCredential value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UidPage()),
                                (route) => false);
                          });
                        },
                        child: FlatButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                'https://images-ext-1.discordapp.net/external/1rty0dfKnzZbPrhz9MLCtZQq2k-sr8Vcrb-1-EzlLH4/https/upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%25282019%2529.png?width=467&height=467',
                                width: 30.0,
                                height: 30.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'เข้าสู่ระบบด้วย Facebook',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'หากยังไม่มีบัญชีผู้ใช้',
                              style: TextStyle(fontSize: 16),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                "ลงทะเบียน",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
