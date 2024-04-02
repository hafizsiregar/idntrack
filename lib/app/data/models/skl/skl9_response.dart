class Dataskl9 {
  int? id;
  String? kelas;
  String? nama;
  int? apps;
  int? itTutorial;
  int? english;
  int? diniyah;
  int? average;
  int? status;

  Dataskl9({
    this.id,
    this.kelas,
    this.nama,
    this.apps,
    this.itTutorial,
    this.english,
    this.diniyah,
    this.average,
    this.status,
  });

  factory Dataskl9.fromJson(Map<String, dynamic> json) => Dataskl9(
        id: json["id"],
        kelas: json["kelas"],
        nama: json["nama"],
        apps: json["apps"],
        itTutorial: json["itTutorial"],
        english: json["english"],
        diniyah: json["diniyah"],
        average: json["average"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
        "nama": nama,
        "apps": apps,
        "itTutorial": itTutorial,
        "english": english,
        "diniyah": diniyah,
        "average": average,
        "status": status,
      };
}
