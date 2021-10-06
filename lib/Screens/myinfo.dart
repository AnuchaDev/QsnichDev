import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Myinfo_Page extends StatefulWidget {
  Myinfo_Page({this.uid});
  final uid;
  @override
  _Myinfo_PageState createState() => _Myinfo_PageState();
}

class _Myinfo_PageState extends State<Myinfo_Page> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    print('kkkkkkkkkkkkkkkkkkkkkkk${widget.uid}');
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: auth.currentUser != null? WebView(
          initialUrl: "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305752038044700&token=j8Q5Ntl_XnuDKO90zJPH&guid=${auth.currentUser!.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ):WebView(
          initialUrl: "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305752038044700&token=j8Q5Ntl_XnuDKO90zJPH&guid=${widget.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
