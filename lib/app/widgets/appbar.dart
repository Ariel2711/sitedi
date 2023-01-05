import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sitedi/app/utils/color.dart';
import 'package:sitedi/app/utils/constant.dart';
import 'package:sitedi/app/utils/images.dart';
import 'package:sitedi/app/utils/widgets.dart';

PreferredSizeWidget appBarWidget({
  required String title,
  bool showDrawer = false,
  bool isWithLogo = false,
  bool showBack = false,
  bool isCenter = false,
  bool isBordered = false,
  bool implyLeading = false,
  PreferredSizeWidget? bottom,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: implyLeading,
    iconTheme: IconThemeData(color: colorBlack),
    leadingWidth: Get.width / 2,
    leading: showBack
        ? BackButton(
            color: colorWhite,
          )
        : null,
    backgroundColor: colorPrimary,
    actions: showDrawer ? [] : actions ?? [56.width],
    elevation: 0,
    flexibleSpace: Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: isBordered
              ? Border(
                  bottom: BorderSide(color: textColorGrey),
                )
              : null,
          // gradient: LinearGradient(
          //   colors: [colorSecondary, colorPrimary],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          color: colorSecondary),
    ),
    centerTitle: isCenter,
    bottom: bottom,
    title: isWithLogo
        ? Row(
            children: [
              3.width,
              Image.asset(
                logo_image,
                height: 50,
              ),
              10.width,
              text(title, fontSize: textSizeMedium, textColor: colorWhite),
            ],
          )
        : text(title, fontSize: textSizeLargeMedium, textColor: colorWhite),
  );
}
