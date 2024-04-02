class UserResponse {
  String? email;
  String? kelas;
  String? nama;
  String? id;

  UserResponse({
    this.email,
    this.kelas,
    this.nama,
    this.id,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        email: json["email"],
        kelas: json["kelas"],
        nama: json["nama"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "kelas": kelas,
        "nama": nama,
        "id": id,
      };
}
