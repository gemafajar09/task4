import 'package:flutter/material.dart';
import 'package:task4/model/Kamus.dart';
import 'package:task4/page/detail/kamuss.dart';

class Detailkamus extends StatefulWidget {
  Detailkamus({this.nama, this.deskripsi});
  String nama, deskripsi;
  Kamus kamus;
  @override
  _DetailkamusState createState() => _DetailkamusState();
}

class _DetailkamusState extends State<Detailkamus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.white,
          onPressed: (){
            Navigator.pushReplacementNamed(context, Kamuss.router);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height /1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 9,
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    widget.nama,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Text(widget.deskripsi,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
