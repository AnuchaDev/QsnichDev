import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
class History_Page extends StatefulWidget {
  History_Page({this.uid});
  final uid;
  @override
  _History_PageState createState() => _History_PageState();
}

class _History_PageState extends State<History_Page> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305762022530000&token=j8Q5Ntl_XnuDKO90zJPH&guid=${auth.currentUser!.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}