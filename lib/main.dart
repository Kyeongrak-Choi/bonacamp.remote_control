import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:server_manager/layouts/otp_auth.dart';
import 'package:server_manager/layouts/server_list.dart';
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
          theme: Themes.light,
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
            GetPage(name: ROUTE_SERVER_LIST, page: () => ServerList()), // main
            // Auth
          ],
          home: Login(),
        ),
      );
    });
  }
}