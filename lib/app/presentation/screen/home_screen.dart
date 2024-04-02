import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/common/routes/app_pages.dart';
import 'package:idn_track/app/data/models/jurnal/diniyyah/jurnal_diniyyah_response.dart';
import 'package:idn_track/app/data/models/jurnal/english/jurnal_english_response.dart';
import 'package:idn_track/app/data/models/jurnal/it/jurnal_it_response.dart';
import 'package:idn_track/app/presentation/controller/c_login.dart';
import 'package:idn_track/app/presentation/controller/c_main.dart';
import 'package:idn_track/app/presentation/widgets/card_jurnal_mapel.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';
import 'package:idn_track/app/utils/shared/drawer.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();

  Future _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DrawerWidget();
  }

  @override
  Widget build(BuildContext context) {
    final cLogin = Get.put(CLogin());
    final cMain = Get.put(CMain());
    String getGoogleDriveImageUrl() {
      // Ganti bagian ini dengan URL Google Drive yang sesuai
      const String googleDriveBaseUrl = "https://drive.google.com/uc?id=";

      // Menggunakan URL Google Drive dengan menambahkan ID di belakangnya
      if (cMain.listDataSiswa.isNotEmpty || cMain.isFetching) {
        return "$googleDriveBaseUrl${cMain.listDataSiswa.last.linkFoto}";
      }
      return "assets/images/blankk.jpeg";
    }

    Widget header() {
      return Obx(
        () => cMain.isFetching || cMain.listDataSiswa.isEmpty
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: 110,
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 10,
                    right: 20,
                    bottom: 20,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                height: 110,
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 20,
                  bottom: 20,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFF3B59F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Obx(() => cMain.listDataSiswa.isNotEmpty
                            ? Text(
                                // widget.cLogin.userData.nama ?? "",
                                cMain.listDataSiswa.first.nama ??
                                    "ini dari main",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SatoshiBold',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            : Text("")),
                        SizedBox(height: 5),
                        Obx(() => cMain.listDataSiswa.isNotEmpty
                            ? Text(
                                // "${widget.cLogin.userData.kelas ?? "kelas"} - ${widget.classData?['wali kelas'] ?? "jaja"}",
                                "${cMain.listDataSiswa.first.kelas ?? "kelas"} - ${cMain.listDataKelas.first.waliKelas ?? "wali kelas"}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            : Text("")),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(getGoogleDriveImageUrl(),
                              scale: 1.0
                              // ??
                              // "https:image.flaticon.com/icons/png/512/149/149071.png"
                              ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
    }

    Widget cardSkl() {
      return Obx(
        () => cMain.isFetching
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )
            : Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: ColorConstant.orangeColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Progres SKL',
                          style: TextStyle(
                            color: ColorConstant.whiteColor,
                            fontSize: 20,
                            fontFamily: 'SatoshiBold',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Progres pertumbuhan SKL\nsiswa untuk seluruh mapel',
                          style: TextStyle(
                            color: ColorConstant.whiteColor,
                            fontSize: 14,
                            fontFamily: 'SatoshiRegular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.skl);
                          },
                          child: Container(
                            height: 40,
                            width: 115,
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Lihat detail ->',
                                style: TextStyle(
                                  color: ColorConstant.orangeColor,
                                  fontSize: 14,
                                  fontFamily: 'SatoshiMedium',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => cMain.listDataSkl7.isNotEmpty ||
                              cMain.listDataSkl8.isNotEmpty ||
                              cMain.listDataSkl9.isNotEmpty
                          ? CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 8.0,
                              percent: cMain.listDataSkl7.isNotEmpty
                                  ? cMain.listDataSkl7.first.average!.toDouble()
                                  : cMain.listDataSkl8.isNotEmpty
                                      ? cMain.listDataSkl8.first.average!
                                          .toDouble()
                                      : cMain.listDataSkl9.isNotEmpty
                                          ? cMain.listDataSkl9.first.average!
                                              .toDouble()
                                          : 0.0,
                              center: Obx(
                                () => cMain.listDataSkl7.isNotEmpty ||
                                        cMain.listDataSkl8.isNotEmpty ||
                                        cMain.listDataSkl9.isNotEmpty
                                    ? Text(
                                        cMain.listDataSkl7.isNotEmpty
                                            ? '${(cMain.listDataSkl7.first.average! * 100).toStringAsFixed(0)}%'
                                            : cMain.listDataSkl8.isNotEmpty
                                                ? '${(cMain.listDataSkl8.first.average! * 100).toStringAsFixed(0)}%'
                                                : '${(cMain.listDataSkl9.first.average! * 100).toStringAsFixed(0)}%',
                                        style: TextStyle(
                                          color: ColorConstant.whiteColor,
                                          fontSize: 20,
                                          fontFamily: 'SatoshiBold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : Text(
                                        '0%',
                                        style: TextStyle(
                                          color: ColorConstant.whiteColor,
                                          fontSize: 20,
                                          fontFamily: 'SatoshiBold',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                              ),
                              progressColor: ColorConstant.whiteColor,
                              backgroundColor: Color(0xffFFD7CA),
                              circularStrokeCap: CircularStrokeCap.round,
                            )
                          : CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 8.0,
                              percent: 0.0,
                              center: Text(
                                '0%',
                                style: TextStyle(
                                  color: ColorConstant.whiteColor,
                                  fontSize: 20,
                                  fontFamily: 'SatoshiBold',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              progressColor: ColorConstant.whiteColor,
                              backgroundColor: Color(0xffFFD7CA),
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                    ),
                  ],
                ),
              ),
      );
    }

    Widget cardDailyJurnal() {
      return Obx(
        () => cMain.isFetching
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jurnal Harian',
                      style: TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 18,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // 'Selasa, 28 Nov ',
                          DateFormat('d MMM yyyy', 'id_ID')
                              .format(selectedDate),
                          style: TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 15,
                            fontFamily: 'SatoshiMedium',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // showDatePicker(
                            //     context: context,
                            //     initialDate: DateTime.now(),
                            //     firstDate: DateTime(2021),
                            //     lastDate: DateTime.now());
                            _selectedDate(context);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Color(0xffE0E0E0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.calendar_month_outlined,
                                size: 20,
                                color: ColorConstant.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      );
    }

    Widget infoCarousel() {
      return Obx(
        () => cMain.isFetching
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.27,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )
            : cMain.listDataSiswa.isNotEmpty
                ? CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.27,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                    ),
                    items: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(
                            "https://drive.google.com/uc?id=1HI-TdebNKFY08tC0wq5cpI63YdaqydPA",
                            fit: BoxFit.cover),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset('assets/images/carousel.png',
                              fit: BoxFit.cover)),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Image.asset('assets/images/carousel2.png',
                              fit: BoxFit.cover)),
                    ],
                  )
                : Container(),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: ListView(
        children: [
          header(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => cMain.isFetching
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    )
                  : Text(
                      'Assalamu’alaikum',
                      style: TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 16,
                        fontFamily: 'SatoshiReguler',
                        height: 0,
                      ),
                    ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() => cMain.isFetching || cMain.listDataSiswa.isEmpty
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                : Text(
                    'Abu/Ummu ${cLogin.userData.nama} 👋',
                    // 'Abu/Ummu ${cMain.listDataSiswa.first.nama} 👋',
                    style: TextStyle(
                      color: ColorConstant.blackColor,
                      fontSize: 20,
                      fontFamily: 'SatoshiBold',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  )),
          ),
          SizedBox(height: 16),
          infoCarousel(),
          cardSkl(),
          SizedBox(height: 4),
          cardDailyJurnal(),
          SizedBox(height: 20),
          Obx(
            () => cMain.isFetching
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                : CardJurnalMapel(
                    color: ColorConstant.youngFirstGreen,
                    materi: cMain.jurnalIT.isNotEmpty
                        ? cMain.jurnalIT
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalITResponse(
                                          materi: "Tidak ada KBM",
                                        ))
                                .materi ??
                            "Tidak ada KBM"
                        : "",
                    colorMateri: ColorConstant.firstGreen,
                    submateri: cMain.jurnalIT.isNotEmpty
                        ? cMain.jurnalIT
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalITResponse(
                                          submateri: "-",
                                        ))
                                .submateri ??
                            "-"
                        : "",
                    colorIcon: ColorConstant.firstGreen,
                    description: cMain.jurnalIT.isNotEmpty
                        ? cMain.jurnalIT
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalITResponse(
                                          indikatorSukse: "-",
                                        ))
                                .indikatorSukse ??
                            "-"
                        : "",
                    absent: 'Hadir',
                  ),
          ),
          Obx(
            () => cMain.isFetching
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                : CardJurnalMapel(
                    color: ColorConstant.youngSecondGreen,
                    materi: cMain.jurnalDiniyah.isNotEmpty
                        ? cMain.jurnalDiniyah
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalDiniyyahResponse(
                                          materi: "Tidak ada KBM",
                                        ))
                                .materi ??
                            "Tidak ada KBM"
                        : "",
                    colorMateri: ColorConstant.secondGreen,
                    submateri: cMain.jurnalDiniyah.isNotEmpty
                        ? cMain.jurnalDiniyah
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalDiniyyahResponse(
                                          submateri: "-",
                                        ))
                                .submateri!
                                .isNotEmpty
                            ? cMain.jurnalDiniyah
                                    .firstWhere(
                                        (element) =>
                                            element.tanggal ==
                                            DateFormat('d MMM yyyy', 'id_ID')
                                                .format(selectedDate),
                                        orElse: () => JurnalDiniyyahResponse(
                                              submateri: "-",
                                            ))
                                    .submateri ??
                                "-"
                            : "-"
                        : "",
                    colorIcon: ColorConstant.secondGreen,
                    description: cMain.jurnalDiniyah.isNotEmpty
                        ? cMain.jurnalDiniyah
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalDiniyyahResponse(
                                          indikatorSukse: "-",
                                        ))
                                .indikatorSukse ??
                            "-"
                        : "-",
                    absent: 'Hadir',
                  ),
          ),
          Obx(
            () => cMain.isFetching
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                : CardJurnalMapel(
                    color: ColorConstant.youngPurpleColor,
                    materi: cMain.jurnalEnglish.isNotEmpty
                        ? cMain.jurnalEnglish
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalEnglishResponse(
                                          materi: "Tidak ada KBM",
                                        ))
                                .materi!
                                .isNotEmpty
                            ? cMain.jurnalEnglish
                                    .firstWhere(
                                        (element) =>
                                            element.tanggal ==
                                            DateFormat('d MMM yyyy', 'id_ID')
                                                .format(selectedDate),
                                        orElse: () => JurnalEnglishResponse(
                                              materi: "Tidak ada KBM",
                                            ))
                                    .materi ??
                                "Tidak ada KBM"
                            : "Tdak ada KBM"
                        : "",
                    colorMateri: ColorConstant.purpleColor,
                    submateri: cMain.jurnalEnglish.isNotEmpty
                        ? cMain.jurnalEnglish
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalEnglishResponse(
                                          submateri: "-",
                                        ))
                                .submateri!
                                .isNotEmpty
                            ? cMain.jurnalEnglish
                                    .firstWhere(
                                        (element) =>
                                            element.tanggal ==
                                            DateFormat('d MMM yyyy', 'id_ID')
                                                .format(selectedDate),
                                        orElse: () => JurnalEnglishResponse(
                                              submateri: "-",
                                            ))
                                    .submateri ??
                                "-"
                            : "-"
                        : "-",
                    colorIcon: ColorConstant.purpleColor,
                    description: cMain.jurnalEnglish.isNotEmpty
                        ? cMain.jurnalEnglish
                                .firstWhere(
                                    (element) =>
                                        element.tanggal ==
                                        DateFormat('d MMM yyyy', 'id_ID')
                                            .format(selectedDate),
                                    orElse: () => JurnalEnglishResponse(
                                          indikatorSukse: "-",
                                        ))
                                .indikatorSukse!
                                .isNotEmpty
                            ? cMain.jurnalEnglish
                                    .firstWhere(
                                        (element) =>
                                            element.tanggal ==
                                            DateFormat('d MMM yyyy', 'id_ID')
                                                .format(selectedDate),
                                        orElse: () => JurnalEnglishResponse(
                                              indikatorSukse: "-",
                                            ))
                                    .indikatorSukse ??
                                "-"
                            : "-"
                        : "-",
                    absent: 'Hadir',
                  ),
          ),
        ],
      ),
    );
  }
}
