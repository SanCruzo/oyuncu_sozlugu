import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Kelimelerim.dart';
import 'dart:math';

class KelimelerList extends StatefulWidget {
  @override
  _KelimelerListState createState() => _KelimelerListState();
}

class _KelimelerListState extends State<KelimelerList> {

  String url = "https://api.jsonbin.io/b/5f082d05a62f9b4b2762365f/2";
  Kelimelerim kelimelerim;
  Future<Kelimelerim> veri;
   static Random random = new Random();
   static int randomNumber = random.nextInt(15);


  Future<Kelimelerim> kelimeleriGetir() async {
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    kelimelerim = Kelimelerim.fromJson(decoded);
    return kelimelerim;
  }
  @override
  void initState() {
    kelimeleriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text("Oyuncu Sözlüğü"),
      ),
      // ignore: missing_return
      body:  Listele());}




  Listele() {
    // ignore: missing_return
    return FutureBuilder(future: kelimeleriGetir(), builder: (context, AsyncSnapshot<Kelimelerim> gelenKelime){
      if(gelenKelime.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      else if (gelenKelime.connectionState==ConnectionState.done){
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(gelenKelime.data.kelimelerim[randomNumber].adi, style: TextStyle(fontSize: 36),textAlign: TextAlign.center,),
            SizedBox(height: 105,),
            Text(gelenKelime.data.kelimelerim[randomNumber].anlam, style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
            SizedBox(height: 105,),
            Row(
              children: <Widget>[
                OutlineButton(onPressed: (){
                  int randoms = random.nextInt(kelimelerim.kelimelerim.length);
                  setState(() {randomNumber= randoms;

                  });
                }, child: Text("Başka kelimeye geç")),

              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ));
      }

    });

  }
}

