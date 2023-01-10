import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitedi/app/utils/color.dart';
import 'package:sitedi/app/utils/constant.dart';
import 'package:sitedi/app/utils/formater.dart';
import 'package:sitedi/app/utils/widgets.dart';
import 'package:sitedi/app/widgets/appbar.dart';
import 'package:sitedi/app/widgets/card_quotes.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sitedi/app/widgets/card_ujian.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidgetwithlogo(title: "SiTEDI", actions: [
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: text(dateFormatter(DateTime.now()),
                  fontSize: textSizeSMedium, textColor: textColorPrimary),
            ))
      ]),
      backgroundColor: colorWhite,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                10.height,
                CardQuotes(),
                15.height,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: text("Ujian Hari ini",
                        textColor: textColorPrimary,
                        fontSize: textSizeLargeMedium),
                  ),
                ),
                15.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int i) {
                        return CardUjian();
                      }),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                    selectedFontSize: 16,
                    selectedItemColor: colorPrimary,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Beranda"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.notifications), label: "Notifikasi"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "Profil")
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
