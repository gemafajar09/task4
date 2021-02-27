import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task4/api/api.dart';
import 'package:task4/model/Galery.dart';
import 'package:task4/model/Kamus.dart';
import 'package:task4/model/Berita.dart';
import 'package:task4/page/detail/beritas.dart';
import 'package:task4/page/detail/gallerys.dart';
import 'package:task4/page/detail/kamuss.dart';
import 'package:task4/page/detail/show/detailberita.dart';
import 'package:task4/page/detail/show/detailgallery.dart';
import 'package:task4/page/detail/show/detailkamus.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  static const router = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Gallery>> getgallery() async {
    List<Gallery> listgallery = [];
    final res = await http.get(Api.url + '/getdata.php');
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      for (var i = 0; i < data.length; i++) {
        var modelgallery = Gallery(
            id: data[i]['id'], judul: data[i]['judul'], foto: data[i]['foto']);
        listgallery.add(modelgallery);
      }
      return listgallery;
    }
  }

  Future<List<Kamus>> getkamus() async {
    List<Kamus> listkamus = [];
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

  Widget _galleryadd(String judul, String foto) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailGallery(
              judul: judul,
              foto: foto,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(foto),
              fit: BoxFit.fill,
            )),
      ),
    );
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, left: 10),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 7.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('asset/background.png'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: MediaQuery.of(context).size.width / 8,
                            color: Colors.transparent,
                          ),
                          image: DecorationImage(
                            image: AssetImage('asset/farms.png'),
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    Container(
                      child: Text(
                        "Farm App",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 5,
                child: GridView.count(
                  crossAxisCount: 3,
                  padding: EdgeInsets.all(8),
                  crossAxisSpacing: 70,
                  children: [
                    // satu
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Gallerys.router);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('asset/gallery.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    // ==============
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Kamuss.router);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('asset/dictionary.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    // ==============
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Beritas.router);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('asset/newspaper.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // gallery
              SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Gallerys.router);
                      },
                      child: Text(
                        "Show All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                child: FutureBuilder<List<Gallery>>(
                  future: getgallery(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot != null ? snapshot.data.length : 0,
                        itemBuilder: (context, i) {
                          List<Gallery> listgallery = snapshot.data;
                          return _galleryadd(
                              listgallery[i].judul, listgallery[i].foto);
                        },
                      );
                    }
                  },
                ),
              ),
              // kamus
              SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Kamus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Kamuss.router);
                      },
                      child: Text(
                        "Show All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: FutureBuilder<List<Kamus>>(
                  future: getkamus(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                        itemCount: snapshot != null ? snapshot.data.length : 0,
                        itemBuilder: (context, i) {
                          List<Kamus> listkamus = snapshot.data;
                          return _kamusadd(
                              listkamus[i].idKamus,
                              listkamus[i].inisial,
                              listkamus[i].nama,
                              listkamus[i].deskripsi);
                        },
                      );
                    }
                  },
                ),
              ),
              // berita
              SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Berita",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, Beritas.router);
                      },
                      child: Text(
                        "Show All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: FutureBuilder<List<Berita>>(
                  future: getBerita(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                        itemCount: snapshot != null ? snapshot.data.length : 0,
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
      ),
    );
  }
}
