import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home_Page extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() {
        return _Home_PageState();
    }
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://flutter.dev/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}