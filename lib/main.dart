import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sitedi/app/integrations/binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  InitBinding();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<User?>(
    //   stream: authC.streamAuth(),
    //   builder: (context, s) {
    //     if (s.connectionState == ConnectionState.active) {
    //       return GetMaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         title: "CONNECT",
    //         initialRoute: s.data != null ? Routes.HOME : Routes.AUTH,
    //         getPages: AppPages.routes,
    //       );
    //     }
    //   },
    // );
    return GetMaterialApp(
      // theme: ThemeData(fontFamily: 'Nunito'),
      localizationsDelegates: [
        // AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('id', ''), // Indonesian, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: "SITEDI",
      initialRoute: Routes.AUTH,
      getPages: AppPages.routes,
    );
  }
}
