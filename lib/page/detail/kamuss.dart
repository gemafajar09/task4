import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task4/api/api.dart';
import 'package:task4/model/Kamus.dart';
import 'package:task4/page/detail/show/detailkamus.dart';
import 'package:task4/page/home.dart';
import 'package:http/http.dart' as http;

class Kamuss extends StatefulWidget {
  Kamuss({Key key}) : super(key: key);
  static const router = '/kamus';
  @override
  _KamussState createState() => _KamussState();
}

class _KamussState extends State<Kamuss> {
  var formKey = GlobalKey<FormState>();
  var pencarian = new TextEditingController();
  bool hasilpencarian = true;
  String cari = '';
  List<Kamus> listkamus = [];
  List<Kamus> hasilfilter = [];

  _KamussState() {
    pencarian.addListener(() {
      hasilfilter.clear();
      if (pencarian.text.isEmpty) {
        setState(() {
          hasilpencarian = true;
          cari = '';
        });
      } else {
        setState(() {
          hasilpencarian = false;
          cari = pencarian.text;
          listkamus.forEach((item) {
            print(item.nama);
            if (item.nama
                .toString()
                .toLowerCase()
                .contains(cari.toLowerCase())) {
              hasilfilter.add(item);
            }
          });
        });
      }
    });
  }

  Future<List<Kamus>> getkamus() async {
    listkamus.clear();
    final res = await http.get(Api.url + '/getkamus.php');
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      for (var i = 0; i < data.length; i++) {
        var modelKamus = Kamus(
            idKamus: data[i]['id_kamus'],
            inisial: data[i]['inisial'],
            nama: data[i]['nama'],
            deskripsi: data[i]['deskripsi']);
        listkamus.add(modelKamus);
      }
      return listkamus;
    }
  }

  Widget _kamusadd(String id, String inisial, String nama, String deskripsi) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green[100],
              maxRadius: 30,
              child: Center(
                child: Text(
                  inisial,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width / 1.7,
              child: Text(nama,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detailkamus(
                      nama: nama,
                      deskripsi: deskripsi,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage('asset/kamus.png'),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 9,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        controller: pencarian,
                        decoration: InputDecoration(
                          labelText: "Pencarian....",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          suffixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: FutureBuilder<List<Kamus>>(
                        future: getkamus(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return hasilpencarian == true
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot != null
                                        ? snapshot.data.length
                                        : 0,
                                    itemBuilder: (context, i) {
                                      List<Kamus> listkamus = snapshot.data;
                                      return _kamusadd(
                                          listkamus[i].idKamus,
                                          listkamus[i].inisial,
                                          listkamus[i].nama,
                                          listkamus[i].deskripsi);
                                    },
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: hasilfilter != null
                                        ? hasilfilter.length
                                        : 0,
                                    itemBuilder: (context, i) {
                                      return _kamusadd(
                                          hasilfilter[i].idKamus,
                                          hasilfilter[i].inisial,
                                          hasilfilter[i].nama,
                                          hasilfilter[i].deskripsi);
                                    },
                                  );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Home.router);
                },
              )
            ],
          ),
        ),
    );
  }
}
