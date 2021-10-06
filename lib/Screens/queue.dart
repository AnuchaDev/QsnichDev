import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Queue_Page extends StatefulWidget {
  Queue_Page({this.uid});
  final uid;
  @override
  _Queue_PageState createState() => _Queue_PageState();
}

class _Queue_PageState extends State<Queue_Page> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305777004273100&token=j8Q5Ntl_XnuDKO90zJPH&guid=${auth.currentUser!.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
