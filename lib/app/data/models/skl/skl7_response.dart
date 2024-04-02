class Dataskl7 {
  int? id;
  String? kelas;
  String? nama;
  double? game;
  double? website;
  double? videoTutorial;
  double? english;
  double? diniyah;
  double? average;
  double? status;

  Dataskl7({
    this.id,
    this.kelas,
    this.nama,
    this.game,
    this.website,
    this.videoTutorial,
    this.english,
    this.diniyah,
    this.average,
    this.status,
  });

  factory Dataskl7.fromJson(Map<String, dynamic> json) => Dataskl7(
        id: json["id"],
        kelas: json["kelas"],
        nama: json["nama"],
        game: json["game"]?.toDouble(),
        website: json["website"]?.toDouble(),
        videoTutorial: json["videoTutorial"]?.toDouble(),
        english: json["english"]?.toDouble(),
        diniyah: json["diniyah"]?.toDouble(),
        average: json["average"]?.toDouble(),
        status: json["status"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
        "nama": nama,
        "game": game,
        "website": website,
        "videoTutorial": videoTutorial,
        "english": english,
        "diniyah": diniyah,
        "average": average,
        "status": status,
      };
}
