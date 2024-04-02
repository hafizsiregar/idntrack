import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idn_track/app/common/routes/app_pages.dart';
import 'package:idn_track/app/presentation/widgets/list_tile.dart';
import '../../presentation/widgets/webview_widget.dart';
import '../constants/color_constant.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
              ),
              child: Text(
                'Menu',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'SatoshiBold',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: ColorConstant.greyColor,
              thickness: 0.5,
            ),
          ),
          ListTileWidget(
              leading:
                  Icon(Icons.help, color: ColorConstant.blackColor, size: 24),
              title: Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 16,
                  fontFamily: 'SatoshiMedium',
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 16, color: ColorConstant.blackColor),
              onTap: () {
                Get.toNamed(Routes.about);
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: ColorConstant.greyColor,
              thickness: 0.5,
            ),
          ),
          ListTileWidget(
              leading: Image.asset('assets/images/logo_idn.png', width: 32),
              title: Text(
                'Profil IDN',
                style: TextStyle(
                  color: ColorConstant.blackColor,
                  fontSize: 16,
                  fontFamily: 'SatoshiMedium',
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 16, color: ColorConstant.blackColor),
              onTap: () {
                Get.to(() => WebViewWidgets(
                      title: 'Profil IDN',
                      url: 'https://idn.sch.id/',
                    ));
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: ColorConstant.greyColor,
              thickness: 0.5,
            ),
          ),
          Spacer(),
          Text(
            'Versi aplikasi',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 14,
              fontFamily: 'SatoshiMedium',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '1.0.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.greyColor,
              fontSize: 14,
              fontFamily: 'SatoshiMedium',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
