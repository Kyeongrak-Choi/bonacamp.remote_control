import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:server_manager/utils/constants.dart';
import 'package:server_manager/utils/database/hive_manager.dart';
import 'package:server_manager/utils/theme/theme_manager.dart';

import 'layouts/login.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();
  // Hive Adapter Regist
  RegisterAdapter();
  await Hive.openBox(LOCAL_DB);
  // init Theme Setting
  Get.changeThemeMode(Hive.box(LOCAL_DB).get(KEY_THEME_MODE, defaultValue: false) ? ThemeMode.dark : ThemeMode.light);

  runApp(AdminManager());
}

class AdminManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
            textScaleFactor: 0.8
        ),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // multi language
          locale: Get.deviceLocale,
          fallbackLocale: Locale('ko', 'KR'),
          // default locale set
          initialBinding: InitBinding(),
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: ThemeMode.system,
          supportedLocales: [
            const Locale('ko', 'KR'),
          ],
          // Route manage
          getPages: [
            // Layout
            GetPage(name: ROUTE_LOGIN, page: () => Login()), // Login
          ],
          home: Login(),
        ),
      );
    });
  }
}

class InitBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(NavigationController());
  }
}