import 'package:flutter/material.dart';
import 'package:idn_track/app/utils/constants/color_constant.dart';

class CardJurnalMapel extends StatelessWidget {
  final Color color;
  final String materi;
  final Color colorMateri;
  final String submateri;
  final Color colorIcon;
  final String description;
  final String absent;
  const CardJurnalMapel(
      {required this.color,
      required this.materi,
      required this.colorMateri,
      required this.submateri,
      required this.colorIcon,
      required this.description,
      required this.absent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: color,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(16),
        //   bottomRight: Radius.circular(16),
        // ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      materi,
                      style: TextStyle(
                        color: colorMateri,
                        fontSize: 20,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      submateri,
                      style: TextStyle(
                        color: ColorConstant.blackColor,
                        fontSize: 20,
                        fontFamily: 'SatoshiBold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.menu_book,
                size: 20,
                color: colorIcon,
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: ColorConstant.blackColor,
              fontSize: 14,
              fontFamily: 'SatoshiRegular',
              fontWeight: FontWeight.w500,
            ),
          ),
          // SizedBox(height: 10),
          // Divider(
          //   color: ColorConstant.greyColor,
          //   thickness: 0.5,
          // ),
          // SizedBox(height: 10),
          // Text(
          //   'Status: $absent',
          //   style: TextStyle(
          //     color: ColorConstant.blackColor,
          //     fontSize: 14,
          //     fontFamily: 'SatoshiRegular',
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
        ],
      ),
    );
  }
}


// Container(
          //   height: 50,
          //   width: double.infinity,
          //   margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          //   decoration: BoxDecoration(
          //     color: ColorConstant.firstGreen,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(16),
          //       topRight: Radius.circular(16),
          //     ),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 12),
          //     child: Row(
          //       children: [
          //         Icon(
          //           Icons.person_outline_outlined,
          //           size: 20,
          //           color: ColorConstant.whiteColor,
          //         ),
          //         SizedBox(width: 8),
          //         Text(
          //           'Mr. Sodik',
          //           style: TextStyle(
          //             color: ColorConstant.whiteColor,
          //             fontSize: 14,
          //             fontFamily: 'SatoshiBold',
          //             fontWeight: FontWeight.w700,
          //           ),
          //         ),
          //         Spacer(),
          //         Container(
          //           padding: const EdgeInsets.all(6),
          //           decoration: BoxDecoration(
          //             color: ColorConstant.whiteColor,
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //           child: Row(
          //             children: [
          //               Icon(
          //                 Icons.watch_later_outlined,
          //                 size: 16,
          //                 color: ColorConstant.blackColor,
          //               ),
          //               SizedBox(width: 4),
          //               Text(
          //                 '07.30 - 09.30',
          //                 style: TextStyle(
          //                   color: ColorConstant.blackColor,
          //                   fontSize: 12,
          //                   fontFamily: 'SatoshiBold',
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),