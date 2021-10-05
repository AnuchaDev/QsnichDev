import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qsnichdev/Screens/AuthScreen/login.dart';
import 'package:qsnichdev/Screens/AuthScreen/register.dart';
import 'package:qsnichdev/Screens/bnavi.dart';
import 'package:qsnichdev/Screens/menu.dart';
import 'package:qsnichdev/Screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
  MaterialApp(
      home: App(),
      theme: ThemeData.light().copyWith(inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder())),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('th'), // Spanish
      ],
    )
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _route = <String, WidgetBuilder>{
      '/register': (BuildContext context) => RegisterPage(),
      '/login': (BuildContext context) => LoginPage(),
      '/menu': (BuildContext context) => Menu_Page(),
    };
    return MaterialApp(
      routes: _route,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Splash();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
