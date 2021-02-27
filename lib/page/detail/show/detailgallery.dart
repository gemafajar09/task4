import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:task4/model/Galery.dart';
import 'package:task4/page/detail/gallerys.dart';

class DetailGallery extends StatefulWidget {
  DetailGallery({this.judul, this.foto});
  String judul, deskripsi, foto;
  Gallery gallery;
  @override
  _DetailGalleryState createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGallery> {
  
  Widget images(){
    return Container(
      height: MediaQuery.of(context).size.height/1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.foto),
          fit: BoxFit.fill,
        )
      ),
    );
  }

  Widget content(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.judul,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
                        Container(
                height: MediaQuery.of(context).size.height / 1,
                margin: EdgeInsets.only(top: 40, left:5,right:5),
                child: ListView(
                  children: <Widget>[
                    SlimyCard(
                      color: Colors.green,
                      width: MediaQuery.of(context).size.width /1,
                      topCardHeight: 250,
                      bottomCardHeight: 100,
                      borderRadius: 15,
                      topCardWidget: images(),
                      bottomCardWidget: content(),
                      slimeEnabled: true,
                    ),
                  ],
                ),
              ),
              BackButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Gallerys.router);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
