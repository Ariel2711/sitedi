import 'package:nb_utils/nb_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:sitedi/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:sitedi/app/utils/color.dart';
import 'package:sitedi/app/utils/constant.dart';
import 'package:sitedi/app/utils/widgets.dart';

class CardQuotes extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(
            3,
            (index) => Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(controller.quotes[index],
                            textColor: colorWhite,
                            fontSize: textSizeSMedium,
                            maxLine: 10),
                        10.height,
                        text(controller.nama[index],
                            textColor: colorWhite, fontSize: textSizeMedium)
                      ]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(controller.image[index]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          colorBlack.withOpacity(0.5),
                          BlendMode.luminosity,
                        )),
                  ),
                );
              },
            ),
          ),
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            enableInfiniteScroll: true,
          ),
        ),
      ],
    );
  }
}
