class Dataskl8 {
  int? id;
  String? kelas;
  String? nama;
  double? multimedia;
  double? embedded;
  double? itTutorial;
  double? english;
  double? diniyah;
  double? average;
  double? status;

  Dataskl8({
    this.id,
    this.kelas,
    this.nama,
    this.multimedia,
    this.embedded,
    this.itTutorial,
    this.english,
    this.diniyah,
    this.average,
    this.status,
  });

  factory Dataskl8.fromJson(Map<String, dynamic> json) => Dataskl8(
        id: json["id"],
        kelas: json["kelas"],
        nama: json["nama"],
        multimedia: json["multimedia"]?.toDouble(),
        embedded: json["embedded"]?.toDouble(),
        itTutorial: json["itTutorial"]?.toDouble(),
        english: json["english"]?.toDouble(),
        diniyah: json["diniyah"]?.toDouble(),
        average: json["average"]?.toDouble(),
        status: json["status"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
        "nama": nama,
        "multimedia": multimedia,
        "embedded": embedded,
        "itTutorial": itTutorial,
        "english": english,
        "diniyah": diniyah,
        "average": average,
        "status": status,
      };
}
