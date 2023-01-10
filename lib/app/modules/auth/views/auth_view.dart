import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitedi/app/routes/app_pages.dart';
import 'package:sitedi/app/utils/color.dart';
import 'package:sitedi/app/utils/constant.dart';
import 'package:sitedi/app/utils/images.dart';
import 'package:sitedi/app/utils/widgets.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ClipRect(
                child: Image.asset(
                  logo_image,
                  width: 210,
                  height: 80,
                ),
              ),
            ),
            10.height,
            Lottie.asset(exam_login, height: 235, width: 235),
            10.height,
            Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: text("Selamat Datang,",
                        textColor: textColorPrimary, fontSize: textSizeMedium),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: text(
                        controller.isStudent
                            ? "Silahkan melakukan login dengan NIS dan password anda"
                            : "Silahkan melakukan login dengan NIP dan password anda",
                        textColor: textColorPrimary,
                        fontSize: textSizeSMedium,
                        maxLine: 3),
                  ),
                  15.height,
                  AppTextField(
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                    textFieldType: TextFieldType.NAME,
                    isValidationRequired: true,
                    showCursor: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    controller: controller.nisC,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      fillColor: colorWhite,
                      filled: true,
                      label: Row(
                        children: [
                          Text(
                            controller.isStudent ? "NIS" : "NIP",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return controller.isStudent
                            ? 'Harap isi NIS Anda'
                            : 'Harap isi NIP Anda';
                      }
                      return null;
                    },
                  ),
                  25.height,
                  AppTextField(
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                    textFieldType: TextFieldType.PASSWORD,
                    showCursor: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: controller.passwordC,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      fillColor: colorWhite,
                      filled: true,
                      label: Row(
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Harap isi password Anda';
                      }
                      return null;
                    },
                  ),
                  15.height,
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: text("Lupa Password?",
                            textColor: textColorPrimary,
                            fontSize: textSizeSMedium),
                      )),
                  15.height,
                  // StaggerAnimation(buttonController: buttonController,)
                  GestureDetector(
                    onTap: (() {
                      Get.toNamed(Routes.HOME);
                    }),
                    child: Obx(
                      () => Container(
                        height: 45,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorPrimary),
                        child: controller.isSaving
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: colorWhite,
                                )),
                              )
                            : Center(
                                child: Text(
                                  "MASUK",
                                  style: TextStyle(
                                      color: colorWhite,
                                      fontWeight: FontWeight.bold,
                                      fontSize: textSizeMedium),
                                ),
                              ),
                      ),
                    ),
                  ),
                  15.height,
                  GestureDetector(
                    child: text(
                        controller.isStudent
                            ? "Login sebagai guru"
                            : "Login sebagai siswa",
                        textColor: textColorPrimary,
                        fontSize: textSizeMedium),
                    onTap: () {
                      controller.isStudent = !controller.isStudent;
                      controller.nisC.clear();
                      controller.passwordC.clear();
                    },
                  ),
                  10.height,
                ]),
                decoration: boxDecorationRoundedWithShadow(15,
                    blurRadius: 3, spreadRadius: 1.5),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
