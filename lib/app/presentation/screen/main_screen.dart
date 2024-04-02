import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/presentation/controller/c_login.dart';
import 'package:idn_track/app/presentation/controller/c_main.dart';
import 'package:idn_track/app/presentation/screen/profile_screen.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';
import 'home_screen.dart';
import 'kaldik_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final cLogin = Get.put(CLogin());
  final cMain = Get.put(CMain());

  @override
  void initState() {
    super.initState();
    cLogin;
    cMain.getDataStudent(cLogin.userData.nama ?? "");
    cMain.getDataClass(cLogin.userData.kelas ?? "");
    cLogin.userData.kelas == '7A' ||
            cLogin.userData.kelas == '7B' ||
            cLogin.userData.kelas == '7C' ||
            cLogin.userData.kelas == '7D' ||
            cLogin.userData.kelas == '7E'
        ? cMain.getDataSkl7(
            cLogin.userData.kelas ?? "", cLogin.userData.nama ?? "")
        : cLogin.userData.kelas == '8A'
            ? cMain.getDataSkl8(
                cLogin.userData.kelas ?? "", cLogin.userData.nama ?? "")
            : cMain.getDataSkl9(
                cLogin.userData.kelas ?? "", cLogin.userData.nama ?? "");
    cMain.getJurnalIT(cLogin.userData.kelas ?? "");
    cMain.getJurnalEnglish(cLogin.userData.kelas ?? "");
    cMain.getJurnalDiniyah(cLogin.userData.kelas ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomeScreen(),
      KaldikScreen(),
      ProfileScreen(),
    ];
    DateTime? currentBackPressTime;
    return WillPopScope(
      onWillPop: () async {
        // Logika konfirmasi keluar

        DateTime now = DateTime.now();

        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tekan sekali lagi untuk keluar'),
            ),
          );

          return false;
        }

        return true;
      },
      child: Scaffold(
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: Obx(
          () => cMain.isFetching
              ? SizedBox()
              : BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  selectedIconTheme:
                      IconThemeData(color: ColorConstant.primaryColor),
                  selectedItemColor: ColorConstant.primaryColor,
                  unselectedItemColor: Colors.grey,
                  unselectedIconTheme: IconThemeData(color: Colors.grey),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Beranda',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month_outlined),
                      label: 'Kaldik',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
