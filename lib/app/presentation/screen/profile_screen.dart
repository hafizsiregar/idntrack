import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/common/routes/app_pages.dart';
import 'package:idn_track/app/data/network/api/api_service.dart';
import 'package:idn_track/app/presentation/controller/c_main.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cMain = Get.put(CMain());
    String getGoogleDriveImageUrl() {
      // Ganti bagian ini dengan URL Google Drive yang sesuai
      const String googleDriveBaseUrl = "https://drive.google.com/uc?id=";

      // Menggunakan URL Google Drive dengan menambahkan ID di belakangnya
      if (cMain.listDataSiswa.isNotEmpty) {
        return "$googleDriveBaseUrl${cMain.listDataSiswa.last.linkFoto}";
      }
      return "";
    }

    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              'Profil Siswa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'SatoshiBold',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24),
            Divider(
              color: ColorConstant.greyColor,
              thickness: 1,
            ),
            SizedBox(height: 32),
            Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ColorConstant.greyColor,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 74,
                      width: 73,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: NetworkImage(getGoogleDriveImageUrl(),
                              // "https:image.flaticon.com/icons/png/512/149/149071.png",
                              scale: 1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // userData?['nama'] ?? "gaada",
                          cMain.listDataSiswa.first.nama ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'SatoshiBold',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          // '${userData?['kelas'] ?? "haha"} • Angkatan ${userData?['angkatan'] ?? "haha"}',
                          '${cMain.listDataSiswa.first.kelas ?? ""} • Angkatan ${cMain.listDataSiswa.first.angkatan ?? ""}',
                          style: TextStyle(
                            color: ColorConstant.greyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SatoshiRegular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              // height: 162,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('NISN',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SatoshiBold',
                          )),
                      SizedBox(width: 36),
                      Text(
                          // userData?['nisn'] ?? "gaada",
                          cMain.listDataSiswa.first.nisn ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SatoshiMedium',
                          )),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: ColorConstant.greyColor,
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('TTL',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SatoshiBold',
                          )),
                      SizedBox(width: 36),
                      Text(
                          // userData?['ttl'] ?? "ajja",
                          cMain.listDataSiswa.first.ttl ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SatoshiMedium',
                          )),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: ColorConstant.greyColor,
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Asal',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SatoshiBold',
                          )),
                      SizedBox(width: 36),
                      Text(
                          // userData?['Alamat Desa'] ?? "haha",
                          cMain.listDataSiswa.first.alamatDesa ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SatoshiMedium',
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              // height: 162,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Ayah',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SatoshiBold',
                          )),
                      SizedBox(width: 36),
                      Expanded(
                        child: Text(
                            // userData?['Nama Ayah'] ?? "haha",
                            cMain.listDataSiswa.first.namaAyah ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SatoshiMedium',
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: ColorConstant.greyColor,
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Ibu',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SatoshiBold',
                          )),
                      SizedBox(width: 36),
                      Text(
                          // userData?['Nama Ibu'] ?? "jhahah",
                          cMain.listDataSiswa.first.namaIbu ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'SatoshiMedium',
                          )),
                    ],
                  ),
                  SizedBox(height: 8),
                  Divider(
                    color: ColorConstant.greyColor,
                    thickness: 1,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Alamat',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SatoshiBold',
                          )),
                      SizedBox(width: 36),
                      Expanded(
                        child: Text(
                            // userData?['Alamat Jalan'] ?? "uaua",
                            cMain.listDataSiswa.first.alamatJalan ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SatoshiMedium',
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              // height: 54,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    'Walas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SatoshiBold',
                    ),
                  ),
                  SizedBox(width: 36),
                  Expanded(
                    child: Text(
                        // "Ust ${classData?['wali kelas'] ?? "haha"}",
                        'Ust ${cMain.listDataKelas.first.waliKelas ?? ""}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SatoshiMedium',
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('Logout'),
                    content: Text('Apakah anda yakin ingin logout?'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('Ya', style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          ApiService().logout();
                          Get.offAllNamed(Routes.login);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('Tidak'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: const EdgeInsets.only(bottom: 20),
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SatoshiBold',
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
