import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' as Image_pick;
import 'package:qsnichdev/Provider/auth_provider.dart';
import 'package:qsnichdev/Screens/AuthScreen/login.dart';
import 'package:qsnichdev/Screens/menu.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  final FocusNode myFocusNode = FocusNode();
  File _image = File("");
  String profilePath = '';
  final picker = Image_pick.ImagePicker();
  bool _passwordVisible = true;
  bool _confirmpasswordVisible = true;
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  var _value;

  @override
  void initState() {
    super.initState();
    downloadImage();
  }

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: Image_pick.ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
      print('Select image path' + _image.path.toString());
    });
  }

  Future downloadImage() async {
    if (profilePath != null) {
      var image = new File(profilePath);
      setState(() {
        _image = image;
      });
    }
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'ลงทะเบียน',
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
    );
  }

  Widget _usernamePasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('คำนำหน้าชื่อ *'),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          // labelText: 'คำนำหน้าชื่อ*',
                          hintText: "คำนำหน้าชื่อ",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      onChanged: (newValue) => setState(() {
                        _value = newValue;
                      }),
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text('นาย'),
                          value: '1',
                        ),
                        DropdownMenuItem(
                          child: Text('นาง'),
                          value: '2',
                        ),
                        DropdownMenuItem(
                          child: Text('นางสาว'),
                          value: '3',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('อื่นๆ'),
                    Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: TextField(
                          // obscureText: true,
                          decoration: InputDecoration(
                            hintText: "กรุณาระบุ อื่นๆ",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            // width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ชื่อ *'),
                Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ ชื่อ",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            // width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('นามสกุล *'),
                Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ นามสกุล",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            // width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('เลขประจำตัวประชาชน *'),
                Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      maxLength: 13,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ เลขประจำตัวประชาชน",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    )),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('เพศ *'),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      // labelText: 'คำนำหน้าชื่อ*',
                      hintText: "กรุณาระบุ เพศ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  onChanged: (newValue) => setState(() {
                    _value = newValue;
                  }),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text('ชาย'),
                      value: '1',
                    ),
                    DropdownMenuItem(
                      child: Text('หญิง'),
                      value: '2',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Text(
                "วันเดือนปีเกิด *",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: SizedBox(
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // obscureText: true,
                    decoration: InputDecoration(
                      hintText: "วัน",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // obscureText: true,
                    decoration: InputDecoration(
                      hintText: "เดือน",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // obscureText: true,
                    decoration: InputDecoration(
                      hintText: "พ.ศ.",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            // width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('หมายเลขโทรศัพท์ *'),
                Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ หมายเลขโทรศัพท์",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            // width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ชื่อผู้ใช้ *'),
                Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ ชื่อผู้ใช้",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            // width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('อีเมล *'),
                Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: TextField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ อีเมลผู้ใช้",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('รหัสผ่าน *'),
                TextField(
                  controller: confirmpassword,
                  obscureText: _confirmpasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'กรุณาระบุ รหัสผ่าน',
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _confirmpasswordVisible = !_confirmpasswordVisible;
                        });
                      },
                    ),
                    // errorText: errorpass ? 'รหัสผ่านไม่ถูกต้อง' : null,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ยืนยันรหัสผ่าน *'),
                TextField(
                  controller: password,
                  obscureText: _passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'กรุณาระบุ ยืนยันรหัสผ่าน',
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    // errorText: errorpass ? 'รหัสผ่านไม่ถูกต้อง' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 15),
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        // side: BorderSide(color: Colors.red)
                      ),
                      child: Text(
                        'ลงทะเบียน',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      color: Colors.blue[700],
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Menu_Page()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return new Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  //sign Out User
                  AuthClass().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                })
          ],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 270.0,
                  width: double.infinity,
                ),
                Container(
                  height: 135,
                  width: double.infinity,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: IconButton(
                //     icon: Icon(Icons.arrow_back_ios),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     color: Colors.blue,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(child: _title()),
                ),
                Positioned(
                  top: 70,
                  left: (MediaQuery.of(context).size.width / 2 - 70.0),
                  child: Container(
                    child: new Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: new Stack(fit: StackFit.loose, children: [
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Center(
                                  child: _image == null
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://img.pngio.com/no-avatar-png-transparent-png-download-for-free-3856300-trzcacak-png-avatar-920_954.png'),
                                          radius: 65.0)
                                      : new CircleAvatar(
                                          backgroundImage:
                                              new FileImage(_image),
                                          radius: 65.0,
                                        ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, left: 90.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new FloatingActionButton(
                                      foregroundColor: Colors.grey,
                                      backgroundColor: Colors.white,
                                      onPressed: getImage,
                                      tooltip: 'Pick Image',
                                      child: Icon(Icons.add_a_photo),
                                    ),
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210, left: 20, right: 20),
                  child: Column(
                    children: [
                      _usernamePasswordWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
