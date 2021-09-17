import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class History_Page extends StatefulWidget {
  @override
  _History_PageState createState() => _History_PageState();
}

class _History_PageState extends State<History_Page> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://www.yahoo.com/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}