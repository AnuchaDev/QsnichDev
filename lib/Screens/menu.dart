import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qsnichdev/Screens/home.dart';
import 'package:qsnichdev/Screens/appointment.dart';
import 'package:qsnichdev/Screens/history.dart';
import 'package:qsnichdev/Screens/AuthScreen/login.dart';
import 'package:qsnichdev/Screens/myinfo.dart';
import 'package:qsnichdev/Screens/queue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:age/age.dart';

class Menu_Page extends StatefulWidget {
    Menu_Page({this.uid});
  final uid;

  @override
  _Menu_PageState createState() => _Menu_PageState();
}

class _Menu_PageState extends State<Menu_Page> {
  String nameclass = 'หน้าหลัก';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var datauser;
  DateTime today = DateTime.now();
  late AgeDuration age;

  Future<bool> getData() async {
    print("uiddd${widget.uid}");
    if (datauser == null && auth.currentUser == null) {
      await firestore
          .collection("users")
          .doc(widget.uid)
          .get()
          .then((value) {
        setState(() {
          datauser = value.data();
          print(
              'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiii${value.data()!['birthday'].toString().split("/")}');
          DateTime birthday = DateTime(
              int.parse(value.data()!['birthday'].toString().split("/")[2]),
              int.parse(value.data()!['birthday'].toString().split("/")[1]),
              int.parse(value.data()!['birthday'].toString().split("/")[0]));
          // DateTime birthday = DateTime(1990, 1, 20);
          age = Age.dateDifference(
              fromDate: birthday, toDate: today, includeToDate: false);

          print('Your age is................. ${age.years}    $birthday');
        });
      });
    }else if(datauser == null && auth.currentUser != null){
       await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .get()
          .then((value) {
        setState(() {
          datauser = value.data();
          print(
              'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiii${value.data()!['birthday'].toString().split("/")}');
          DateTime birthday = DateTime(
              int.parse(value.data()!['birthday'].toString().split("/")[2]),
              int.parse(value.data()!['birthday'].toString().split("/")[1]),
              int.parse(value.data()!['birthday'].toString().split("/")[0]));
          // DateTime birthday = DateTime(1990, 1, 20);
          age = Age.dateDifference(
              fromDate: birthday, toDate: today, includeToDate: false);

          print('Your age is................. ${age.years}    $birthday');
        });
      });
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(nameclass),
            ),
            body:
                // nameclass == "login"? Login_Page():
                nameclass == "หน้าหลัก"
                    ? Home_Page()
                    : nameclass == "ประวัติการรักษา"
                        ? History_Page()
                        : nameclass == "ข้อมูลของฉัน"
                            ? Myinfo_Page()
                            : nameclass == "นัดหมาย"
                                ? Appointment_Page()
                                : nameclass == 'คิวของฉัน'
                                    ? Queue_Page()
                                    : LoginPage(),
            drawer: Container(
              width: width * 0.70,
              child: new Drawer(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 180,
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //     padding:
                          //         const EdgeInsets.only(top: 10, left: 165),
                          //     child: const DecoratedBox(
                          //       decoration: const BoxDecoration(
                          //           color: Colors.red,
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10))),
                          //       child: Text('  รอตรวจสอบ  ',
                          //           style: TextStyle(
                          //               fontSize: 16, color: Colors.white)),
                          //     )),
                          Padding(
                            padding: const EdgeInsets.only(top: 45, left: 10),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(datauser['imageprofile']),
                              radius: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Text(
                              '${datauser['firstname']}  ${datauser['lastname']}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "เพศ : ${datauser['gender']}    อายุ: ${age.years}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // UserAccountsDrawerHeader(
                    //   decoration: BoxDecoration(
                    //     color: Colors.blue,
                    //     // borderRadius: BorderRadius.all(Radius.circular(10))
                    //   ),
                    //   accountName: Text("Anucha Ar'art"),
                    //   accountEmail: Text("anucha.su.61@ubu.ac.th"),
                    //   currentAccountPicture: CircleAvatar(
                    //     backgroundImage: NetworkImage(
                    //         'https://scontent.fbkk10-1.fna.fbcdn.net/v/t1.6435-9/48382402_1468943199904553_3400320523001921536_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHY85MVTqs1ShEH-UPqxBs-Af2gYIqEY5AB_aBgioRjkKoJDOtnKEqTvne5xFU3zcTxhMnAeXV0tRC5C2NojcMC&_nc_ohc=vfoZGIsrVfEAX_W28m6&_nc_ht=scontent.fbkk10-1.fna&oh=a6e4d6829e3418e438edd12f71971e07&oe=60B07736'),
                    //   ),
                    // ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          nameclass = "หน้าหลัก";
                        });

                        Navigator.of(context).pop();
                      },
                      leading: Image.network(
                          'https://cdn.discordapp.com/attachments/834620062090133543/885763382421114880/unknown.png',
                          width: 30,
                          height: 30,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          colorBlendMode: BlendMode.modulate),
                      title: Text(
                        "หน้าหลัก",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          nameclass = "ข้อมูลของฉัน";
                        });

                        Navigator.of(context).pop();
                      },
                      leading: Image.network(
                          'https://cdn.discordapp.com/attachments/834620062090133543/836836380675145758/969312.png',
                          width: 30,
                          height: 30,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          colorBlendMode: BlendMode.modulate),
                      title: Text(
                        "ข้อมูลของฉัน",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          nameclass = "ประวัติการรักษา";
                        });

                        Navigator.of(context).pop();
                      },
                      leading: Image.network(
                          'https://media.discordapp.net/attachments/834620062090133543/836834745303826472/3601157.png',
                          width: 30,
                          height: 30,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          colorBlendMode: BlendMode.modulate),
                      title: Text(
                        "ประวัติการรักษา",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          nameclass = "นัดหมาย";
                        });

                        Navigator.of(context).pop();
                      },
                      leading: Image.network(
                        'https://media.discordapp.net/attachments/834620062090133543/836835672051417128/3652191.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        "นัดหมาย",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          nameclass = "คิวของฉัน";
                        });

                        Navigator.of(context).pop();
                      },
                      leading: Image.network(
                        'https://media.discordapp.net/attachments/834620062090133543/836834856531918878/3113776.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        "คิวของฉัน",
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      onTap: () {
                        auth.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/login", (route) => false);
                      },
                      leading: Image.network(
                        'https://media.discordapp.net/attachments/834620062090133543/837178484370571274/logout.png',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        "ออกจากระบบ",
                        style: TextStyle(
                            fontSize: 18, color: Colors.redAccent[700]),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.redAccent[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
