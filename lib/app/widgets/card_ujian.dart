import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';
import 'package:sitedi/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:sitedi/app/utils/color.dart';
import 'package:sitedi/app/utils/constant.dart';
import 'package:sitedi/app/utils/widgets.dart';

class CardUjian extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        text("Bahasa Indonesia",
            textColor: colorWhite, fontSize: textSizeMedium),
        10.height,
        Row(
          children: [
            Icon(
              Icons.person,
              color: colorWhite,
              size: 20,
            ),
            5.width,
            text("Agus Hariyadi",
                textColor: colorWhite, fontSize: textSizeSMedium),
          ],
        ),
        10.height,
        Row(
          children: [
            Icon(
              Icons.timer_sharp,
              color: colorWhite,
              size: 20,
            ),
            5.width,
            text("08.00 - 10.00",
                textColor: colorWhite, fontSize: textSizeSMedium),
          ],
        ),
        10.height,
        Row(
          children: [
            Icon(
              Icons.book,
              color: colorWhite,
              size: 20,
            ),
            5.width,
            text("50 soal", textColor: colorWhite, fontSize: textSizeSMedium),
          ],
        ),
        40.height,
        Row(
          children: [
            text("Buka Ujian", textColor: colorWhite, fontSize: textSizeMedium),
            5.width,
            Icon(
              Icons.navigate_next,
              color: colorWhite,
              size: 25,
            ),
          ],
        ),
      ]),
      decoration: boxDecorationWithRoundedCorners(
          backgroundColor: colorPrimary,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
