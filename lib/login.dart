import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task4/api/api.dart';
import 'package:task4/page/splash.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  static const router = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool pengecekan = true;
  var formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  var msg = '';

  tampilPassword() {
    setState(() {
      pengecekan = !pengecekan;
    });
  }

   Future<List> _login() async {
    final response = await http.post(Api.url+'/login.php', body: {
      "username": _username.text,
      "password": _password.text,
    });
    final data = jsonDecode(response.body);
    print(data);
    int value = data['value'];
    String nama = data['nama'];
    String iduser = data['id'];
    if (value == 1) {
      savePref(value, nama, iduser);
      showToast('Selamat datang.');
      Navigator.pushReplacementNamed(context, Splash.router);
    } else {
      _username.clear();
      _password.clear();
      showToast('Invalid Data');
    }
  }

  void savePref(int value, String nama, String iduser) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", value);
    preferences.setString("nama", nama);
    preferences.setString("id", iduser);
    preferences.commit();
    setState(() {});
  }

  void getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getInt("value") == 1) {
        Navigator.pushReplacementNamed(context, Splash.router);
      }
    });
  }

   @override
  void initState() {
    super.initState();
    getPref();
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
            "Log In",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 40),
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
              if (_username.text.isNotEmpty) {
                if (_password.text.isNotEmpty) {
                  _login();
                } else {
                  showToast('Maaf Password Kosong.!');
                }
              } else {
                showToast('Maaf Username Kosong.!');
              }
            },
            child: Text(
              'Login',
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
        body: SingleChildScrollView(
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
                      fit: BoxFit.fill
                    ),
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
                height: MediaQuery.of(context).size.height / 2.3,
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
        ));
  }
}
