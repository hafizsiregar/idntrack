import 'package:get/get.dart';
import 'package:idn_track/app/presentation/screen/about_app_screen.dart';
import 'package:idn_track/app/presentation/screen/login_screen.dart';
import 'package:idn_track/app/presentation/screen/main_screen.dart';
import 'package:idn_track/app/presentation/screen/resgister_screen.dart';
import 'package:idn_track/app/presentation/screen/skl_screen.dart';
import 'package:idn_track/app/presentation/screen/splash_screen.dart';
import 'app_pages.dart';

class AppPages {
  AppPages._();

  static const String initial = Routes.splash;
  static const String afterLogin = Routes.main;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.main,
      page: () => MainScreen(),
    ),
    // GetPage(
    //   name: Routes.home,
    //   page: () => HomeScreen(),
    // ),
    GetPage(
      name: Routes.skl,
      page: () => SKLScreen(),
    ),
    GetPage(
      name: Routes.about,
      page: () => AboutAppScreen(),
    ),
  ];
}
