import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../utils/constants/color_constant.dart';

class KaldikScreen extends StatelessWidget {
  const KaldikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
            Text(
              'Kalender Pendidikan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'SatoshiBold',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              color: ColorConstant.greyColor,
              thickness: 1,
            ),
            SizedBox(
              height: 600,
              child: SfPdfViewer.asset('assets/pdf/kaldik.pdf'),
            ),
          ],
        ),
      ),
    );
  }
}
