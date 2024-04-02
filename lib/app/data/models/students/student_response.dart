import 'dart:convert';

AllDataResponse allDataResponseFromJson(String str) =>
    AllDataResponse.fromJson(json.decode(str));

String allDataResponseToJson(AllDataResponse data) =>
    json.encode(data.toJson());

class AllDataResponse {
  List<Datasiswa>? datasiswa;

  AllDataResponse({
    this.datasiswa,
  });

  factory AllDataResponse.fromJson(Map<String, dynamic> json) =>
      AllDataResponse(
        datasiswa: json["datasiswa"] == null
            ? []
            : List<Datasiswa>.from(
                json["datasiswa"]!.map((x) => Datasiswa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datasiswa": datasiswa == null
            ? []
            : List<dynamic>.from(datasiswa!.map((x) => x.toJson())),
      };
}

class Datasiswa {
  int? no;
  String? nama;
  String? nisn;
  String? ttl;
  String? kelas;
  int? angkatan;
  String? linkFoto;
  String? agama;
  String? alamatJalan;
  String? alamatDesa;
  String? namaAyah;
  String? namaIbu;

  Datasiswa({
    this.no,
    this.nama,
    this.nisn,
    this.ttl,
    this.kelas,
    this.angkatan,
    this.linkFoto,
    this.agama,
    this.alamatJalan,
    this.alamatDesa,
    this.namaAyah,
    this.namaIbu,
  });

  factory Datasiswa.fromJson(Map<String, dynamic> json) => Datasiswa(
        no: json["no"],
        nama: json["nama"],
        nisn: json["nisn"],
        ttl: json["ttl"],
        kelas: json["kelas"],
        angkatan: json["angkatan"],
        linkFoto: json["linkFoto"],
        agama: json["agama"],
        alamatJalan: json["alamatJalan"],
        alamatDesa: json["alamatDesa"],
        namaAyah: json["namaAyah"],
        namaIbu: json["namaIbu"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "nama": nama,
        "nisn": nisn,
        "ttl": ttl,
        "kelas": kelas,
        "linkFoto": linkFoto,
        "agama": agama,
        "alamatJalan": alamatJalan,
        "alamatDesa": alamatDesa,
        "namaAyah": namaAyah,
        "namaIbu": namaIbu,
      };
}
