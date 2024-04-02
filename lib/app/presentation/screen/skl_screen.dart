import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/presentation/controller/c_main.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SKLScreen extends StatelessWidget {
  const SKLScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cMain = Get.put(CMain());

    // Fungsi untuk menghitung persentase total
    double percent = 12.2; // Persentase yang diinginkan

    double gamePercent = cMain.listDataSkl7.isNotEmpty
        ? cMain.listDataSkl7.first.game! * (percent / 100)
        : 0.0;

    double websitePercent = cMain.listDataSkl7.isNotEmpty
        ? cMain.listDataSkl7.first.website! * (percent / 100)
        : 0.0;

    double videoTutorialPercent = cMain.listDataSkl7.isNotEmpty
        ? cMain.listDataSkl7.first.videoTutorial! * (percent / 100)
        : 0.0;

// Hitung total persentase
    double totalPercent = gamePercent + websitePercent + videoTutorialPercent;

    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Progress SKL',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'SatoshiBold',
                  fontWeight: FontWeight.w700,
                ),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(height: 24),
            Divider(
              color: ColorConstant.greyColor,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorConstant.firstGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'IT',
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: 18,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 42),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.youngFirstGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(children: [
                Obx(
                  () => cMain.listDataSkl7.isNotEmpty ||
                          cMain.listDataSkl8.isNotEmpty ||
                          cMain.listDataSkl9.isNotEmpty
                      ? CircularPercentIndicator(
                          radius: 55.0,
                          lineWidth: 12.0,
                          percent: cMain.listDataSkl7.isNotEmpty
                              ? totalPercent
                              : cMain.listDataSkl8.isNotEmpty
                                  ? cMain.listDataSkl8.first.embedded!
                                              .toDouble() *
                                          12.2 /
                                          100 +
                                      cMain.listDataSkl8.first.multimedia!
                                              .toDouble() *
                                          12.2 /
                                          100 +
                                      cMain.listDataSkl8.first.itTutorial!
                                              .toDouble() *
                                          12.2 /
                                          100
                                  : cMain.listDataSkl9.isNotEmpty
                                      ? cMain.listDataSkl9.first.apps!
                                          .toDouble()
                                      : 0.0,
                          center: Obx(
                            () => cMain.listDataSkl7.isNotEmpty ||
                                    cMain.listDataSkl8.isNotEmpty ||
                                    cMain.listDataSkl9.isNotEmpty
                                ? Text(
                                    cMain.listDataSkl7.isNotEmpty
                                        ? '${((cMain.listDataSkl7.first.game!.toDouble() + cMain.listDataSkl7.first.website!.toDouble() + cMain.listDataSkl7.first.videoTutorial!.toDouble()) / 3 * 100).toStringAsFixed(0)}%'
                                        : cMain.listDataSkl8.isNotEmpty
                                            ? '${((cMain.listDataSkl8.first.embedded!.toDouble() + cMain.listDataSkl8.first.multimedia!.toDouble() + cMain.listDataSkl8.first.itTutorial!.toDouble()) / 3 * 100).toStringAsFixed(0)}%'
                                            : cMain.listDataSkl9.isNotEmpty
                                                ? '${((cMain.listDataSkl9.first.apps!.toDouble() + cMain.listDataSkl9.first.itTutorial!.toDouble()) / 2 * 100).toStringAsFixed(0)}%'
                                                : '0%',
                                    style: TextStyle(
                                      color: ColorConstant.firstGreen,
                                      fontSize: 28,
                                      fontFamily: 'SatoshiBold',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : Text(
                                    "0%",
                                    style: TextStyle(
                                      color: ColorConstant.firstGreen,
                                      fontSize: 28,
                                      fontFamily: 'SatoshiBold',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                          progressColor: ColorConstant.firstGreen,
                          backgroundColor: Color(0xffB8DCE8),
                          circularStrokeCap: CircularStrokeCap.round,
                        )
                      : CircularPercentIndicator(
                          radius: 55.0,
                          lineWidth: 12.0,
                          percent: 0.0,
                          center: Text(
                            "0%",
                            style: TextStyle(
                              color: ColorConstant.firstGreen,
                              fontSize: 28,
                              fontFamily: 'SatoshiBold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          progressColor: ColorConstant.firstGreen,
                          backgroundColor: Color(0xffB8DCE8),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project IT:',
                      style: TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 16,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16),
                    Obx(
                      () => cMain.listDataSkl7.isNotEmpty ||
                              cMain.listDataSkl8.isNotEmpty ||
                              cMain.listDataSkl9.isNotEmpty
                          ? Text(
                              cMain.listDataSkl7.isNotEmpty
                                  ? 'Game'
                                  : cMain.listDataSkl8.isNotEmpty
                                      ? 'Multimedia'
                                      : cMain.listDataSkl9.isNotEmpty
                                          ? 'Apps'
                                          : '',
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 14,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 14,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                    Obx(
                      () => cMain.listDataSkl7.isNotEmpty ||
                              cMain.listDataSkl8.isNotEmpty ||
                              cMain.listDataSkl9.isNotEmpty
                          ? Text(
                              cMain.listDataSkl7.isNotEmpty
                                  ? 'Website'
                                  : cMain.listDataSkl8.isNotEmpty
                                      ? 'Embedded'
                                      : cMain.listDataSkl9.isNotEmpty
                                          ? 'IT Tutorial'
                                          : '',
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 14,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 14,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                    Obx(
                      () => cMain.listDataSkl7.isNotEmpty ||
                              cMain.listDataSkl8.isNotEmpty ||
                              cMain.listDataSkl9.isNotEmpty
                          ? Text(
                              cMain.listDataSkl7.isNotEmpty
                                  ? 'Video Tutorial'
                                  : cMain.listDataSkl8.isNotEmpty
                                      ? 'IT Tutorial'
                                      : cMain.listDataSkl9.isNotEmpty
                                          ? ''
                                          : '',
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 14,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 14,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  ],
                ),
              ]),
            ),
            SizedBox(height: 28),
            Divider(
              color: ColorConstant.greyColor,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 28),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorConstant.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'English',
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: 18,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 42),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffE9EEFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Obx(
                    () => cMain.listDataSkl7.isNotEmpty ||
                            cMain.listDataSkl8.isNotEmpty ||
                            cMain.listDataSkl9.isNotEmpty
                        ? CircularPercentIndicator(
                            radius: 55.0,
                            lineWidth: 12.0,
                            percent: cMain.listDataSkl7.isNotEmpty
                                ? cMain.listDataSkl7.first.english!.toDouble() /
                                    100.0
                                : cMain.listDataSkl8.isNotEmpty
                                    ? cMain.listDataSkl8.first.english!
                                            .toDouble() /
                                        100.0
                                    : cMain.listDataSkl9.isNotEmpty
                                        ? cMain.listDataSkl9.first.english!
                                            .toDouble()
                                        : 0.0,
                            center: Obx(
                              () => cMain.listDataSkl7.isNotEmpty ||
                                      cMain.listDataSkl8.isNotEmpty ||
                                      cMain.listDataSkl9.isNotEmpty
                                  ? Text(
                                      cMain.listDataSkl7.isNotEmpty
                                          ? '${(cMain.listDataSkl7.first.english!.toDouble() * 100).toStringAsFixed(0)}%'
                                          : cMain.listDataSkl8.isNotEmpty
                                              ? '${(cMain.listDataSkl8.first.english!.toDouble() * 100).toStringAsFixed(0)}%'
                                              : cMain.listDataSkl9.isNotEmpty
                                                  ? '${(cMain.listDataSkl9.first.english!.toDouble() * 100).toStringAsFixed(0)}%'
                                                  : '0%',
                                      style: TextStyle(
                                        color: ColorConstant.purpleColor,
                                        fontSize: 28,
                                        fontFamily: 'SatoshiBold',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  : Text(
                                      "0%",
                                      style: TextStyle(
                                        color: ColorConstant.firstGreen,
                                        fontSize: 28,
                                        fontFamily: 'SatoshiBold',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                            progressColor: ColorConstant.purpleColor,
                            backgroundColor: Color(0xffC5CEEC),
                            circularStrokeCap: CircularStrokeCap.round,
                          )
                        : CircularPercentIndicator(
                            radius: 55.0,
                            lineWidth: 12.0,
                            percent: 0.0,
                            center: Text(
                              "0%",
                              style: TextStyle(
                                color: ColorConstant.firstGreen,
                                fontSize: 28,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            progressColor: ColorConstant.firstGreen,
                            backgroundColor: Color(0xffB8DCE8),
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        'Project English:',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 16,
                          fontFamily: 'SatoshiBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 16),
                      Obx(
                        () => cMain.listDataSkl7.isNotEmpty ||
                                cMain.listDataSkl8.isNotEmpty ||
                                cMain.listDataSkl9.isNotEmpty
                            ? Text(
                                cMain.listDataSkl7.isNotEmpty
                                    ? 'English'
                                    : cMain.listDataSkl8.isNotEmpty
                                        ? 'English'
                                        : cMain.listDataSkl9.isNotEmpty
                                            ? 'English'
                                            : '',
                                style: TextStyle(
                                  color: ColorConstant.purpleColor,
                                  fontSize: 14,
                                  fontFamily: 'SatoshiBold',
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : Text(
                                '',
                                style: TextStyle(
                                  color: ColorConstant.firstGreen,
                                  fontSize: 14,
                                  fontFamily: 'SatoshiBold',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Divider(
              color: ColorConstant.greyColor,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 28),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: ColorConstant.secondGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Diniyyah',
                      style: TextStyle(
                        color: ColorConstant.whiteColor,
                        fontSize: 18,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 42),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.youngSecondGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Obx(
                    () => cMain.listDataSkl7.isNotEmpty ||
                            cMain.listDataSkl8.isNotEmpty ||
                            cMain.listDataSkl9.isNotEmpty
                        ? CircularPercentIndicator(
                            radius: 55.0,
                            lineWidth: 12.0,
                            percent: cMain.listDataSkl7.isNotEmpty
                                ? cMain.listDataSkl7.first.diniyah!.toDouble() /
                                    100.0
                                : cMain.listDataSkl8.isNotEmpty
                                    ? cMain.listDataSkl8.first.diniyah!
                                            .toDouble() /
                                        100.0
                                    : cMain.listDataSkl9.isNotEmpty
                                        ? cMain.listDataSkl9.first.diniyah!
                                            .toDouble()
                                        : 0.0,
                            center: Obx(
                              () => cMain.listDataSkl7.isNotEmpty ||
                                      cMain.listDataSkl8.isNotEmpty ||
                                      cMain.listDataSkl9.isNotEmpty
                                  ? Text(
                                      cMain.listDataSkl7.isNotEmpty
                                          ? '${(cMain.listDataSkl7.first.diniyah!.toDouble() * 100).toStringAsFixed(0)}%'
                                          : cMain.listDataSkl8.isNotEmpty
                                              ? '${(cMain.listDataSkl8.first.diniyah!.toDouble() * 100).toStringAsFixed(0)}%'
                                              : cMain.listDataSkl9.isNotEmpty
                                                  ? '${(cMain.listDataSkl9.first.diniyah!.toDouble() * 100).toStringAsFixed(0)}%'
                                                  : '0%',
                                      style: TextStyle(
                                        color: ColorConstant.secondGreen,
                                        fontSize: 28,
                                        fontFamily: 'SatoshiBold',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  : Text(
                                      "0%",
                                      style: TextStyle(
                                        color: ColorConstant.secondGreen,
                                        fontSize: 28,
                                        fontFamily: 'SatoshiBold',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                            progressColor: ColorConstant.secondGreen,
                            backgroundColor: Color(0xffDAEFC4),
                            circularStrokeCap: CircularStrokeCap.round,
                          )
                        : CircularPercentIndicator(
                            radius: 55.0,
                            lineWidth: 12.0,
                            percent: 0.0,
                            center: Text(
                              "0%",
                              style: TextStyle(
                                color: ColorConstant.secondGreen,
                                fontSize: 28,
                                fontFamily: 'SatoshiBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            progressColor: ColorConstant.secondGreen,
                            backgroundColor: Color(0xffB8DCE8),
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text(
                        'Project Diniyyah:',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 16,
                          fontFamily: 'SatoshiBold',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 16),
                      Obx(
                        () => cMain.listDataSkl7.isNotEmpty ||
                                cMain.listDataSkl8.isNotEmpty ||
                                cMain.listDataSkl9.isNotEmpty
                            ? Text(
                                cMain.listDataSkl7.isNotEmpty
                                    ? 'Diniyyah'
                                    : cMain.listDataSkl8.isNotEmpty
                                        ? 'Diniyyah'
                                        : cMain.listDataSkl9.isNotEmpty
                                            ? 'Diniyyah'
                                            : '',
                                style: TextStyle(
                                  color: ColorConstant.secondGreen,
                                  fontSize: 14,
                                  fontFamily: 'SatoshiBold',
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : Text(
                                '',
                                style: TextStyle(
                                  color: ColorConstant.firstGreen,
                                  fontSize: 14,
                                  fontFamily: 'SatoshiBold',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
