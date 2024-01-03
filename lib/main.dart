import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:server_manager/layouts/otp_auth.dart';
import 'package:server_manager/utils/constants.dart';
import 'package:server_manager/utils/database/hive_manager.dart';
import 'package:server_manager/utils/theme/theme_manager.dart';

import 'firebase_options.dart';
import 'layouts/login.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();
  // Hive Adapter Regist
  RegisterAdapter();
  await Hive.openBox(LOCAL_DB);
  // init Theme Setting
  Get.changeThemeMode(
      Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: false)
          ? ThemeMode.dark
          : ThemeMode.light);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AdminManager());
}

class AdminManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // multi language
          locale: Get.deviceLocale,
          fallbackLocale: Locale('ko', 'KR'),
          // default locale set
          // initialBinding: InitBinding(),
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: ThemeMode.system,
          supportedLocales: [
            const Locale('ko', 'KR'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // Route manage
          getPages: [
            // Layout
            GetPage(name: ROUTE_LOGIN, page: () => Login()), // Login
            GetPage(name: ROUTE_AUTH, page: () => OTPAuth()), // Google OTP Auth
          ],
          home: Login(),
        ),
      );
    });
  }
}

// class InitBinding implements Bindings {
//   @override
//   void dependencies() {
//     //Get.put(NavigationController());
//   }
// }
