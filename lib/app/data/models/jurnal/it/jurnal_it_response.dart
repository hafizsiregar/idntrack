class JurnalITResponse {
  String? kelas7A;
  String? tanggal;
  String? materi;
  String? submateri;
  String? indikatorSukse;
  String? nama;

  JurnalITResponse({
    this.kelas7A,
    this.tanggal,
    this.materi,
    this.submateri,
    this.indikatorSukse,
    this.nama,
  });

  factory JurnalITResponse.fromJson(Map<String, dynamic> json) =>
      JurnalITResponse(
        kelas7A: json["kelas7A"],
        tanggal: json["tanggal"],
        materi: json["materi"],
        submateri: json["subMateri"],
        indikatorSukse: json["indikatorSukses"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "kelas7A": kelas7A,
        "tanggal": tanggal,
        "materi": materi,
        "subMateri": submateri,
        "indikatorSukses": indikatorSukse,
        "nama": nama,
      };
}
