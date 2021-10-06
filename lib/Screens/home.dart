import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_Page extends StatefulWidget {
  Home_Page({this.uid});
  final uid;
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() {
    return _Home_PageState();
  }
}

class _Home_PageState extends State<Home_Page> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: auth.currentUser != null ?  WebView(
          initialUrl:
              "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305532045066500&token=j8Q5Ntl_XnuDKO90zJPH&guid=${auth.currentUser!.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ):WebView(
          initialUrl:
              "https://cloudhis.childrenhospital.go.th/ezforms2/ezform-data/index?ezf_id=1632305532045066500&token=j8Q5Ntl_XnuDKO90zJPH&guid=${widget.uid}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
