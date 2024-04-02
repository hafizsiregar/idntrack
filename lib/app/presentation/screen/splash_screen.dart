import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/presentation/controller/c_login.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';
import 'package:idn_track/app/utils/constants/image_constant.dart';
import '../../common/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cLogin = Get.put(CLogin());
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.offNamed(Routes.login);
      } else {
        cLogin.getCurrentUser(user.uid);
        Get.offAllNamed(Routes.main);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Tidak perbolehkan keluar saat di Splash Screen
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(ImageConstant.logo),
            ),
            SizedBox(height: 20),
            Text(
              'IDN Track',
              style: TextStyle(
                fontFamily: 'SatoshiBlack',
                fontSize: 32,
                color: ColorConstant.primaryColor,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
    // Scaffold(
    //     backgroundColor: ColorConstant.whiteColor,
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Center(
    //           child: Image.asset(ImageConstant.logo),
    //         ),
    //         SizedBox(height: 20),
    //         Text(
    //           'IDN Track',
    //           style: TextStyle(
    //             fontFamily: 'SatoshiBlack',
    //             fontSize: 32,
    //             color: ColorConstant.primaryColor,
    //             fontWeight: FontWeight.w800,
    //           ),
    //         )
    //       ],
    //     ));
  }
}
