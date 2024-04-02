import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/common/routes/app_pages.dart';
import 'package:idn_track/app/presentation/controller/c_login.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';
import 'package:idn_track/app/utils/shared/item_carousel.dart';
import '../../utils/shared/dot_indicator.dart';
import '../../utils/shared/txt_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final key = GlobalKey<FormState>();
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 0.25),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.25, end: 0.75),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.75, end: 1),
        weight: 1,
      ),
    ]).animate(_rotationController);

    _rotationController.repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'Track progres\nsiswa dengan\nmudah tanpa\nada masalah',
      'Pantau kegiatan\nmingguan,\nbulanan,\nkapanpun',
      'Lihat perkem-\nbangan siswa\ndengan satu\naplikasi '
    ];

    final cLogin = Get.put(CLogin());
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
        body: Obx(
          () => cLogin.cCommon.isFetching
              ? Container(
                  color: Colors.white,
                  child: RotationTransition(
                    turns: _rotationAnimation,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Form(
                        key: key,
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                CarouselSlider(
                                  carouselController: CarouselController(),
                                  options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height,
                                    viewportFraction: 1,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 4),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                  ),
                                  items: [
                                    itemCarousel(
                                        context,
                                        'Track progres\nsiswa dengan\nmudah ',
                                        'tanpa\nada masalah'),
                                    itemCarousel(
                                        context,
                                        'Pantau kegiatan\nmingguan,\nbulanan,\n',
                                        'kapanpun'),
                                    itemCarousel(
                                        context,
                                        'Lihat perkem-\nbangan siswa\ndengan ',
                                        'satu aplikasi '),
                                  ],
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: Row(
                                      children: [
                                        dotIndicator(
                                          currentIndex ==
                                                  titles.indexOf(titles[0])
                                              ? 25
                                              : 10,
                                          currentIndex ==
                                                  titles.indexOf(titles[0])
                                              ? ColorConstant.whiteColor
                                              : Color(0xff94A5FF),
                                        ),
                                        SizedBox(width: 5),
                                        dotIndicator(
                                          currentIndex ==
                                                  titles.indexOf(titles[1])
                                              ? 25
                                              : 10,
                                          currentIndex ==
                                                  titles.indexOf(titles[1])
                                              ? ColorConstant.whiteColor
                                              : Color(0xff94A5FF),
                                        ),
                                        SizedBox(width: 5),
                                        dotIndicator(
                                          currentIndex ==
                                                  titles.indexOf(titles[2])
                                              ? 25
                                              : 10,
                                          currentIndex ==
                                                  titles.indexOf(titles[2])
                                              ? ColorConstant.whiteColor
                                              : Color(0xff94A5FF),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: ColorConstant.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                                child: ListView(
                                  padding: EdgeInsets.only(top: 0),
                                  children: [
                                    txtFormField(
                                      cLogin.email,
                                      ((value) => value == ''
                                          ? 'Isi email terlebih dahulu'
                                          : null),
                                      'Email',
                                      Icon(Icons.email_outlined),
                                      false,
                                    ),
                                    txtFormField(
                                      cLogin.password,
                                      ((value) => value == ''
                                          ? 'Isi password terlebih dahulu'
                                          : null),
                                      'Password',
                                      Icon(Icons.lock_outline),
                                      true,
                                    ),
                                    SizedBox(height: 16),
                                    GestureDetector(
                                      onTap: () {
                                        Get.showSnackbar(
                                          GetSnackBar(
                                            title: 'Lupa password?',
                                            message: 'Silahkan hubungi admin',
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Lupa password?',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: ColorConstant.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final isValid =
                                            key.currentState!.validate();
                                        if (isValid) {
                                          await cLogin.login();
                                          if (cLogin.cCommon.isSuccessfull) {
                                            Get.snackbar(
                                              'Berhasil',
                                              cLogin.cCommon.message,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: ColorConstant
                                                  .youngSecondGreen,
                                              animationDuration:
                                                  Duration(seconds: 2),
                                            );
                                            Get.offAllNamed(Routes.main);
                                            cLogin.email.clear();
                                            cLogin.password.clear();
                                          } else {
                                            Get.snackbar(
                                              'Gagal',
                                              cLogin.cCommon.message,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: Colors.red[300],
                                              animationDuration:
                                                  Duration(seconds: 2),
                                            );
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        maximumSize: Size(327, 54),
                                        minimumSize: Size(327, 54),
                                        backgroundColor:
                                            ColorConstant.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        'Masuk',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'SatoshiBold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
