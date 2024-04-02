import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Tentang Aplikasi',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'SatoshiBold',
            fontWeight: FontWeight.w700,
          ),
          // style: boldBlackFontStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'IDN Track',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 20,
                  fontFamily: 'SatoshiBold',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'IDN Track adalah aplikasi yang digunakan untuk memantau kegiatan siswa SMP IDN Jonggol di sekolah. Aplikasi ini dibuat oleh Developer IDN',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 16,
                  fontFamily: 'SatoshiMedium',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
