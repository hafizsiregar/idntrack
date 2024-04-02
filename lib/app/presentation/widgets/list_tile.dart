import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Widget leading;
  final Text title;
  final Widget trailing;
  final void Function()? onTap;
  const ListTileWidget(
      {required this.leading,
      required this.title,
      required this.trailing,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      // Icon(Icons.help, color: ColorConstant.blackColor, size: 24),
      title: title,
      // Text(
      //   'Tentang Aplikasi',
      //   style: TextStyle(
      //     color: ColorConstant.blackColor,
      //     fontSize: 16,
      //     fontFamily: 'SatoshiMedium',
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      trailing: trailing,
      // Icon(Icons.arrow_forward_ios_rounded,
      //     size: 16, color: ColorConstant.blackColor),
      onTap: onTap,
    );
  }
}
