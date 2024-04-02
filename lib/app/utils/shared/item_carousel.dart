import 'package:flutter/material.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';

itemCarousel(BuildContext context, String title1, String title2) {
  return Container(
    padding: EdgeInsets.all(32),
    color: ColorConstant.primaryColor,
    width: MediaQuery.of(context).size.width,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: TextStyle(
              fontFamily: 'SatoshiBlack',
              fontSize: 38,
              color: ColorConstant.whiteColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: title2,
            style: TextStyle(
              fontFamily: 'SatoshiBlack',
              fontSize: 38,
              color: Color(0xff94A5FF),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  );
}
