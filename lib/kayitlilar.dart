import 'package:flutter/material.dart';
import 'package:kelimeler_app/Kelimelerim.dart';

class Kayitlilar extends StatefulWidget {
  @override
  _KayitlilarState createState() => _KayitlilarState();
}

class _KayitlilarState extends State<Kayitlilar> {
  List<KelimelerimElement> tumKelimeler;
int kelimeSayisi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıtlı Kelimelerim"),),
      body: Padding(
        padding: EdgeInsets.all(15),
        child:
        Row(
          children: <Widget>[
            Text(""),
            ],
        ),
      ),
    );
  }
}
