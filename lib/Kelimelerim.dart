import 'dart:convert';

Kelimelerim kelimelerimFromJson(String str) => Kelimelerim.fromJson(json.decode(str));

String kelimelerimToJson(Kelimelerim data) => json.encode(data.toJson());

class Kelimelerim {


  Kelimelerim({


    this.kelimelerim,

  });

  List<KelimelerimElement> kelimelerim;

  factory Kelimelerim.fromJson(Map<String, dynamic> json) => Kelimelerim(
    kelimelerim: List<KelimelerimElement>.from(json["Kelimelerim"].map((x) => KelimelerimElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Kelimelerim": List<dynamic>.from(kelimelerim.map((x) => x.toJson())),
  };
}

class KelimelerimElement {
  KelimelerimElement({
    this.id,
    this.adi,
    this.anlam,
  });

  int id;
  String adi;
  String anlam;


  factory KelimelerimElement.fromJson(Map<String, dynamic> json) => KelimelerimElement(
    id: json["ID"],
    adi: json["Adi"],
    anlam: json["Anlam"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Adi": adi,
    "Anlam": anlam,
  };


}
