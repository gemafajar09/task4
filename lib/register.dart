import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task4/api/api.dart';
import 'package:task4/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);
  static const router = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool pengecekan = true;
  var formKey = GlobalKey<FormState>();
  final _nama = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  var msg = '';

  tampilPassword() {
    setState(() {
      pengecekan = !pengecekan;
    });
  }

  Future<List> register() async {
    final response = await http.post(Api.url + '/register.php', body: {
      "nama": _nama.text,
      "username": _username.text,
      "password": _password.text,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    if (value == 1) {
      showToast('Silahkan login.');
      Navigator.pushReplacementNamed(context, Login.router);
    } else {
      _nama.clear();
      _username.clear();
      _password.clear();
      showToast('Invalid Data');
    }
  }

  showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green[200],
        textColor: Colors.white);
  }

  Widget form() {
    return Column(
      children: [
        Center(
          child: Text(
            "Register",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: TextFormField(
            controller: _nama,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Nama",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: TextFormField(
            controller: _username,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(32)),
          child: TextFormField(
            controller: _password,
            obscureText: pengecekan,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: tampilPassword,
                  icon: Icon(
                      pengecekan ? Icons.visibility_off : Icons.visibility),
                ),
                contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32))),
          ),
        ),
        SizedBox(height: 24),
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30),
          color: Colors.green,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              if (_username.text.isNotEmpty && _nama.text.isNotEmpty) {
                if (_password.text.isNotEmpty) {
                  register();
                } else {
                  showToast('Maaf Password Kosong.!');
                }
              } else {
                showToast('Maaf Periksa Kembali.!');
              }
            },
            child: Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: formKey,
        backgroundColor: Colors.green[100],
        resizeToAvoidBottomPadding: true,
        body: SafeArea(
                  child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          image: DecorationImage(
                              image: AssetImage('asset/background.png'),
                              fit: BoxFit.fill),
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey,
                            )
                          ]),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(15),
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey,
                            )
                          ]),
                      child: form(),
                    )
                  ],
                ),
              ),
              BackButton(color: Colors.white,
              onPressed: (){
                Navigator.pushReplacementNamed(context, Login.router);
              },
            )
            ],
          ),
        ));
  }
}
