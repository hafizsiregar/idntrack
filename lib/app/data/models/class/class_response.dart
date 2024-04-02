// To parse this JSON data, do
//
//     final allDataResponse = allDataResponseFromJson(jsonString);

import 'dart:convert';

AllDataResponse allDataResponseFromJson(String str) =>
    AllDataResponse.fromJson(json.decode(str));

String allDataResponseToJson(AllDataResponse data) =>
    json.encode(data.toJson());

class AllDataResponse {
  List<Datakelas>? datakelas;

  AllDataResponse({
    this.datakelas,
  });

  factory AllDataResponse.fromJson(Map<String, dynamic> json) =>
      AllDataResponse(
        datakelas: json["datakelas"] == null
            ? []
            : List<Datakelas>.from(
                json["datakelas"]!.map((x) => Datakelas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datakelas": datakelas == null
            ? []
            : List<dynamic>.from(datakelas!.map((x) => x.toJson())),
      };
}

class Datakelas {
  int? id;
  String? kelas;
  String? waliKelas;
  String? guruIt;
  String? guruEnglish;
  String? guruDiniyah;

  Datakelas({
    this.id,
    this.kelas,
    this.waliKelas,
    this.guruIt,
    this.guruEnglish,
    this.guruDiniyah,
  });

  factory Datakelas.fromJson(Map<String, dynamic> json) => Datakelas(
        id: json["id"],
        kelas: json["kelas"],
        waliKelas: json["waliKelas"],
        guruIt: json["guruIt"],
        guruEnglish: json["guruEnglish"],
        guruDiniyah: json["guruDiniyah"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
        "waliKelas": waliKelas,
        "guruIt": guruIt,
        "guruEnglish": guruEnglish,
        "guruDiniyah": guruDiniyah,
      };
}
