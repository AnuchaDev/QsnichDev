import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Appointment_Page extends StatefulWidget {
  Appointment_Page({this.uid});
  final uid;
  @override
  _Appointment_PageState createState() => _Appointment_PageState();
}

class _Appointment_PageState extends State<Appointment_Page> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305772028701500&token=j8Q5Ntl_XnuDKO90zJPH&guid=${auth.currentUser!.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
