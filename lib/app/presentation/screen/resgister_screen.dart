import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/common/routes/app_pages.dart';
import 'package:idn_track/app/presentation/controller/c_register.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';
import 'package:idn_track/app/utils/shared/item_carousel.dart';
import '../../utils/shared/dot_indicator.dart';
import '../../utils/shared/txt_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentIndex = 0;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'Track progres\nsiswa dengan\nmudah tanpa\nada masalah',
      'Pantau kegiatan\nmingguan,\nbulanan,\nkapanpun',
      'Lihat perkem-\nbangan siswa\ndengan satu\naplikasi '
    ];

    final cRegister = Get.put(CRegister());

    return Scaffold(
      body: Obx(
        () => cRegister.cCommon.isFetching
            ? Center(
                child: CircularProgressIndicator(),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Form(
                      key: _key,
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
                                      _currentIndex = index;
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
                                        _currentIndex ==
                                                titles.indexOf(titles[0])
                                            ? 25
                                            : 10,
                                        _currentIndex ==
                                                titles.indexOf(titles[0])
                                            ? ColorConstant.whiteColor
                                            : Color(0xff94A5FF),
                                      ),
                                      SizedBox(width: 5),
                                      dotIndicator(
                                        _currentIndex ==
                                                titles.indexOf(titles[1])
                                            ? 25
                                            : 10,
                                        _currentIndex ==
                                                titles.indexOf(titles[1])
                                            ? ColorConstant.whiteColor
                                            : Color(0xff94A5FF),
                                      ),
                                      SizedBox(width: 5),
                                      dotIndicator(
                                        _currentIndex ==
                                                titles.indexOf(titles[2])
                                            ? 25
                                            : 10,
                                        _currentIndex ==
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
                              height: MediaQuery.of(context).size.height * 0.5,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: ListView(
                                children: [
                                  txtFormField(
                                    cRegister.nama,
                                    ((value) => value == ''
                                        ? 'Isi nama lengkap terlebih dahulu'
                                        : null),
                                    'Nama Lengkap',
                                    Icon(Icons.person_outline),
                                    false,
                                  ),
                                  txtFormField(
                                    cRegister.email,
                                    ((value) => value == ''
                                        ? 'Isi email terlebih dahulu'
                                        : null),
                                    'Email',
                                    Icon(Icons.email_outlined),
                                    false,
                                  ),
                                  txtFormField(
                                    cRegister.password,
                                    ((value) => value == ''
                                        ? 'Isi password terlebih dahulu'
                                        : null),
                                    'Password',
                                    Icon(Icons.lock_outline),
                                    true,
                                  ),
                                  txtFormField(
                                    cRegister.kelas,
                                    ((value) => value == ''
                                        ? 'Isi kelas terlebih dahulu'
                                        : null),
                                    'Kelas',
                                    Icon(Icons.school_outlined),
                                    false,
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
                                          _key.currentState!.validate();
                                      if (isValid) {
                                        await cRegister.register();
                                        if (cRegister.cCommon.isSuccessfull) {
                                          Get.snackbar(
                                            'Berhasil',
                                            cRegister.cCommon.message,
                                            snackPosition: SnackPosition.BOTTOM,
                                            animationDuration:
                                                Duration(seconds: 2),
                                            backgroundColor: Colors.green[200],
                                          );
                                          Get.offNamed(Routes.login);
                                          cRegister.nama.clear();
                                          cRegister.email.clear();
                                          cRegister.password.clear();
                                          cRegister.kelas.clear();
                                        } else {
                                          Get.snackbar(
                                            'Gagal',
                                            cRegister.cCommon.message,
                                            snackPosition: SnackPosition.BOTTOM,
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
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      'Daftar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'SatoshiBold',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sudah punya akun? ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorConstant.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'SatoshiMedium',
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.login);
                                        },
                                        child: Text(
                                          'Login',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorConstant.primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'SatoshiBold',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
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
    );
  }
}
