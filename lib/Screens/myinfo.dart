import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Myinfo_Page extends StatefulWidget {
  @override
  _Myinfo_PageState createState() => _Myinfo_PageState();
}

class _Myinfo_PageState extends State<Myinfo_Page> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://qsnichdev.orchid.thaihis.org/ezforms2/ezform-data/index?ezf_id=1629620910032264300&token=i0ttJkQqjKYA7dD7jG_p",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
