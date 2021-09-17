import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Appointment_Page extends StatefulWidget {
  @override
  _Appointment_PageState createState() => _Appointment_PageState();
}

class _Appointment_PageState extends State<Appointment_Page> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://www.google.com/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
