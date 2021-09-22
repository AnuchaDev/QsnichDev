import 'package:flutter/material.dart';
import 'package:qsnichdev/Screens/home.dart';
import 'package:qsnichdev/Screens/appointment.dart';
import 'package:qsnichdev/Screens/history.dart';
import 'package:qsnichdev/Screens/queue.dart';

class Bnavi extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() {
    return _BnaviState();
  }
}

class _BnaviState extends State<Bnavi> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    Home_Page(),
    History_Page(),
    Appointment_Page(),
    Queue_Page(),
  ];
  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.network(
          'https://cdn.discordapp.com/attachments/834620062090133543/885763382421114880/unknown.png',
          width: 30,
          height: 30,
          color: Color.fromRGBO(255, 255, 255, 1),
          colorBlendMode: BlendMode.modulate),
      title: Text('หน้าหลัก'),
    ),
    BottomNavigationBarItem(
      icon: Image.network(
          'https://media.discordapp.net/attachments/834620062090133543/836834745303826472/3601157.png',
          width: 30,
          height: 30,
          color: Color.fromRGBO(255, 255, 255, 1),
          colorBlendMode: BlendMode.modulate),
      title: Text('ประวัติการรักษา'),
    ),
    BottomNavigationBarItem(
      icon: Image.network(
        'https://media.discordapp.net/attachments/834620062090133543/836835672051417128/3652191.png',
        width: 30,
        height: 30,
      ),
      title: Text('นัดหมาย'),
    ),
    BottomNavigationBarItem(
      icon: Image.network(
        'https://media.discordapp.net/attachments/834620062090133543/836834856531918878/3113776.png',
        width: 30,
        height: 30,
      ),
      title: Text('คิวของฉัน'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
