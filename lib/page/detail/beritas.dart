import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task4/api/api.dart';
import 'package:task4/model/Berita.dart';
import 'package:task4/page/detail/show/detailberita.dart';
import 'package:task4/page/home.dart';

class Beritas extends StatefulWidget {
  Beritas({Key key}) : super(key: key);
  static const router = '/berita';
  @override
  _BeritasState createState() => _BeritasState();
}

class _BeritasState extends State<Beritas> {
  Future<List<Berita>> getBerita() async {
    List<Berita> listBerita = [];
    final res = await http.get(Api.url + '/getberita.php');
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      for (var i = 0; i < data.length; i++) {
        var modelBerita = Berita(
            id: data[i]['id'],
            judul: data[i]['judul'],
            deskripsi: data[i]['deskripsi'],
            foto: data[i]['foto']);
        listBerita.add(modelBerita);
      }
      return listBerita;
    }
  }

  Widget _beritaadd(String judul, String deskripsi, String foto) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detailberita(
              judul: judul,
              deskripsi: deskripsi,
              foto: foto,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              ),
            ]),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(foto),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.7,
                  padding: EdgeInsets.all(3),
                  child: Text(
                    judul,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: MediaQuery.of(context).size.height / 8,
                  padding: EdgeInsets.all(3),
                  child: Text(
                    deskripsi,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          image: AssetImage('asset/beritas.png'),
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: FutureBuilder<List<Berita>>(
                      future: getBerita(),
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
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount:
                                snapshot != null ? snapshot.data.length : 0,
                            itemBuilder: (context, i) {
                              List<Berita> listberita = snapshot.data;
                              return _beritaadd(listberita[i].judul,
                                  listberita[i].deskripsi, listberita[i].foto);
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
