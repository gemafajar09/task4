import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task4/api/api.dart';
import 'package:task4/model/Galery.dart';
import 'package:task4/page/detail/show/detailgallery.dart';
import 'package:task4/page/home.dart';
import 'package:http/http.dart' as http;

class Gallerys extends StatefulWidget {
  Gallerys({Key key}) : super(key: key);
  static const router = '/gallery';
  @override
  _GallerysState createState() => _GallerysState();
}

class _GallerysState extends State<Gallerys> {
  Future<List<Gallery>> getgallery() async {
    List<Gallery> listgallery = [];
    final res = await http.get(Api.url + '/getdata.php');
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      for (var i = 0; i < data.length; i++) {
        var modelgallery = Gallery(
            id: data[i]['id'],
            judul: data[i]['judul'],
            foto: data[i]['foto']);
        listgallery.add(modelgallery);
      }
      return listgallery;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Home.router);
          },
        ),
        title: Text(
          "Gallerys",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Gallery>>(
          future: getgallery(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height / 1,
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: snapshot != null ? snapshot.data.length : 0,
                    itemBuilder: (context, i) {
                      List<Gallery> listgallery = snapshot.data;
                      return InkWell(
                        onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailGallery(
                                    judul: listgallery[i].judul,
                                    foto: listgallery[i].foto,
                                  ),
                                  ),
                                  );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                              image: DecorationImage(
                                image: NetworkImage(listgallery[i].foto),
                                fit: BoxFit.fill,
                              )),
                        ),
                      );
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
