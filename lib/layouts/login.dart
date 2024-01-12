import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:server_manager/components/login/login_logo.dart';

import '../components/login/login_btn.dart';
import '../utils/constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (LoginController controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  BASIC_PADDING * 2.w,
                  MediaQuery.of(context).size.height / 5.h,
                  BASIC_PADDING * 2.w,
                  BASIC_PADDING * 4.h),
              child: LoginLogo(), // Logo
            ),
            Padding(
              padding: EdgeInsets.all(BASIC_PADDING * 2),
              child: LoginBtn(), // ID
            ),
          ],
        ),
      );
    });
  }
}

class LoginController extends GetxController {}
