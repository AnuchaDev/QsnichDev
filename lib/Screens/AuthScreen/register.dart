import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart' as Image_pick;
import 'package:intl/intl.dart';
import 'package:qsnichdev/Provider/auth_provider.dart';
import 'package:qsnichdev/Screens/AuthScreen/login.dart';
import 'package:qsnichdev/Screens/menu.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:nextflow_thai_personal_id/nextflow_thai_personal_id.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({this.Urlimage});
  final Urlimage;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final databaseReference = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final format = DateFormat("dd-MM-yyyy");
  bool isLoading = false;
  final FocusNode myFocusNode = FocusNode();
  File _image = File("");
  String profilePath = '';
  final picker = Image_pick.ImagePicker();
  bool _passwordVisible = true;
  bool _confirmpasswordVisible = true;
  bool _checkpassword = false;
  bool _checkconfirmpassword = false;
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  var _value;
  var _value2;
  var _rename;
  bool _checkrename = false;
  final _fname = TextEditingController();
  bool _checkfname = false;
  final _lname = TextEditingController();
  bool _checklname = false;
  final _cid = TextEditingController();
  bool _checkcid = false;
  var _gender;
  bool _checkgender = false;
  var _birthday;
  bool _checkbirthday = false;
  final _phone = TextEditingController();
  bool _checkphone = false;
  final _email = TextEditingController();
  bool _checkemail = false;
  ThaiIdValidator validator = ThaiIdValidator(
      errorMessage:
          'เลขบัตรประจำตัวประชาชนไม่ถูกต้อง กรุณาตรวจสอบใหม่อีกครั้ง');

  @override
  void initState() {
    print(".................${widget.Urlimage}");
    super.initState();
    downloadImage();
  }

  Future getTime() async {
    DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: DateTime.now(), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.th);
  }

  Future getImage() async {
    print("Imageee...${_image.path}");
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

  Future<bool> addCoin() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('kkkk').doc('kkkkk').set({"ttttttt": "kkkkkkkk"});
    return true;
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
                          errorText: _checkrename ? 'กรุณากรอกข้อมูล' : null,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      onChanged: (newValue) => setState(() {
                        _value = newValue;
                        if (newValue == '1') {
                          _rename = 'เด็กชาย';
                        } else if (newValue == '2') {
                          _rename = 'เด็กหญิง';
                        } else if (newValue == '3') {
                          _rename = 'นาย';
                        } else if (newValue == '4') {
                          _rename = 'นาง';
                        } else if (newValue == '5') {
                          _rename = 'นางสาว';
                        }
                      }),
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text('เด็กชาย'),
                          value: '1',
                        ),
                        DropdownMenuItem(
                          child: Text('เด็กหญิง'),
                          value: '2',
                        ),
                        DropdownMenuItem(
                          child: Text('นาย'),
                          value: '3',
                        ),
                        DropdownMenuItem(
                          child: Text('นาง'),
                          value: '4',
                        ),
                        DropdownMenuItem(
                          child: Text('นางสาว'),
                          value: '5',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child: SizedBox(
            //     width: 180,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text('อื่นๆ'),
            //         Padding(
            //             padding: const EdgeInsets.only(top: 3),
            //             child: TextField(
            //               // obscureText: true,
            //               decoration: InputDecoration(
            //                 hintText: "กรุณาระบุ อื่นๆ",
            //                 contentPadding: const EdgeInsets.symmetric(
            //                     vertical: 10, horizontal: 10),
            //                 border: OutlineInputBorder(
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(8))),
            //               ),
            //             )),
            //       ],
            //     ),
            //   ),
            // ),
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
                      controller: _fname,
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ ชื่อ",
                        errorText: _checkfname ? 'กรุณากรอกข้อมูล' : null,
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
                      controller: _lname,
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ นามสกุล",
                        errorText: _checklname ? 'กรุณากรอกข้อมูล' : null,
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
                      controller: _cid,
                      maxLength: 13,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ เลขประจำตัวประชาชน",
                        errorText: _checkcid
                            ? 'เลขบัตรประจำตัวประชาชนไม่ถูกต้อง กรุณาตรวจสอบใหม่อีกครั้ง'
                            : null,
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
                      errorText: _checkgender ? 'กรุณากรอกข้อมูล' : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  onChanged: (newValue) => setState(() {
                    print("llllllll...$newValue");
                    if (newValue == '1') {
                      _gender = 'ชาย';
                    } else if (newValue == '2') {
                      _gender = 'หญิง';
                    }
                    _value2 = newValue;
                  }),
                  value: _value2,
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
                  width: 150,
                  child: DateTimeField(
                    format: format,
                    onChanged: (date) {
                      setState(() {
                        _birthday = '${date!.day}/${date.month}/${date.year}';
                      });
                      print('change $date');
                    },
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime.now(),
                        builder: (context, child) => Localizations.override(
                          context: context,
                          locale: Locale('th'),
                          child: child,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: SizedBox(
              //     width: 60,
              //     child: TextField(
              //       keyboardType: TextInputType.number,
              //       inputFormatters: <TextInputFormatter>[
              //         FilteringTextInputFormatter.digitsOnly
              //       ],
              //       // obscureText: true,
              //       decoration: InputDecoration(
              //         hintText: "เดือน",
              //         contentPadding: const EdgeInsets.symmetric(
              //             vertical: 10, horizontal: 15),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(8))),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: SizedBox(
              //     width: 60,
              //     child: TextField(
              //       keyboardType: TextInputType.number,
              //       inputFormatters: <TextInputFormatter>[
              //         FilteringTextInputFormatter.digitsOnly
              //       ],
              //       // obscureText: true,
              //       decoration: InputDecoration(
              //         hintText: "พ.ศ.",
              //         contentPadding: const EdgeInsets.symmetric(
              //             vertical: 10, horizontal: 15),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(8))),
              //       ),
              //     ),
              //   ),
              // ),
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
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ หมายเลขโทรศัพท์",
                        errorText: _checkphone ? 'กรุณากรอกข้อมูล' : null,
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
        // Padding(
        //   padding: const EdgeInsets.only(top: 8),
        //   child: SizedBox(
        //     // width: 180,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text('ชื่อผู้ใช้ *'),
        //         Padding(
        //             padding: const EdgeInsets.only(top: 3),
        //             child: TextField(
        //               // obscureText: true,
        //               decoration: InputDecoration(
        //                 hintText: "กรุณาระบุ ชื่อผู้ใช้",
        //                 contentPadding: const EdgeInsets.symmetric(
        //                     vertical: 10, horizontal: 10),
        //                 border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(Radius.circular(8))),
        //               ),
        //             )),
        //       ],
        //     ),
        //   ),
        // ),
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
                      controller: _email,
                      // obscureText: true,
                      decoration: InputDecoration(
                        hintText: "กรุณาระบุ อีเมลผู้ใช้",
                        errorText: _checkemail ? 'กรุณากรอกข้อมูล' : null,
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
                  controller: password,
                  obscureText: _passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'กรุณาระบุ รหัสผ่าน',
                    errorText: _checkpassword ? 'กรุณากรอกข้อมุล' : null,
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
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ยืนยันรหัสผ่าน *'),
                        TextField(
                          controller: confirmpassword,
                          obscureText: _confirmpasswordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'กรุณาระบุ รหัสผ่านอีกครั้ง',
                            errorText: _checkconfirmpassword
                                ? 'รหัสผ่านไม่ตรงกัน'
                                : null,
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
                                  _confirmpasswordVisible =
                                      !_confirmpasswordVisible;
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
                      onPressed: () async {
                        print('data.........${auth.currentUser!.uid}');
                        print("Imageprofile....${widget.Urlimage}");
                        print("rename....$_rename");
                        print("fname....${_fname.text}");
                        print('lname.....${_lname.text}');
                        print('CID..... ${_cid.text}');
                        print('gender.....$_gender');
                        print('birthday....$_birthday');
                        print('phone.....${_phone.text}');
                        print('email....${_email.text}');
                        print('pass....${password.text}');
                        print('conpass....${confirmpassword.text}');

                        String errorMessage = validator.validate(_cid.text);

                        setState(() async {
                          if (_rename == null) {
                            _checkrename = true;
                          } else {
                            _checkrename = false;
                          }
                          if (_fname.text.isEmpty) {
                            _checkfname = true;
                          } else {
                            _checkfname = false;
                          }
                          if (_lname.text.isEmpty) {
                            _checklname = true;
                          } else {
                            _checklname = false;
                          }
                          if (_gender == null) {
                            _checkgender = true;
                          } else {
                            _checkgender = false;
                          }
                          if (_phone.text.isEmpty) {
                            _checkphone = true;
                          } else {
                            _checkphone = false;
                          }
                          if (_email.text.isEmpty) {
                            _checkemail = true;
                          } else {
                            _checkemail = false;
                          }
                          if (password.text.isEmpty) {
                            _checkpassword = true;
                          } else {
                            _checkpassword = false;
                          }
                          if (confirmpassword.text != password.text ||
                              confirmpassword.text.isEmpty) {
                            _checkconfirmpassword = true;
                          } else {
                            _checkconfirmpassword = false;
                          }
                          if (errorMessage != null) {
                            _checkcid = true;
                            print('Errormessage ....$errorMessage');
                          } else {
                            print('yes');
                            _checkcid = false;
                          }

                          if (_checkrename == false &&
                              _checkfname == false &&
                              _checklname == false &&
                              _checkcid == false &&
                              _checkgender == false &&
                              _birthday != null &&
                              _checkphone == false &&
                              _checkemail == false &&
                              _checkpassword == false &&
                              _checkconfirmpassword == false) {
                            print("gogogogogogogogogog......");
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            await firestore
                                .collection('users')
                                .doc(auth.currentUser!.uid)
                                .set({
                              "imageprofile": widget.Urlimage,
                              "prename": _rename,
                              "firstname": _fname.text,
                              "lastname": _lname.text,
                              "cid": _cid.text,
                              "gender": _gender,
                              "birthday": _birthday,
                              "phonenumber": _phone.text,
                              "email": _email.text,
                              "password": password.text
                            }).then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Menu_Page())));

                            //       Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            //     builder: (context) => Menu_Page()));
                          }
                        });
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
                                  child: _image.path == ''
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              '${widget.Urlimage}'),
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
                                      onPressed: getTime,
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
