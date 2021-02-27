import 'package:flutter/material.dart';
import 'package:task4/page/detail/beritas.dart';

class Detailberita extends StatefulWidget {
  Detailberita({this.judul, this.deskripsi, this.foto});
  String foto, judul, deskripsi;
  @override
  _DetailberitaState createState() => _DetailberitaState();
}

class _DetailberitaState extends State<Detailberita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.of(context).size.width / 2,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      return Stack(
                        children: [
                          Image.network(
                            widget.foto,
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Text(widget.judul,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            children: [
                              Text(
                                widget.deskripsi,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                )
              ],
            ),
            BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, Beritas.router);
              },
            )
          ],
        ),
      ),
    );
  }
}
