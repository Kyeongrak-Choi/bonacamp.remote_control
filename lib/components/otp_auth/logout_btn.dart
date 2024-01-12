import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/components/login/login_btn.dart';
import 'package:server_manager/utils/utility.dart';

import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LogoutBtnController());
    Get.put(LoginBtnController());
    return GetBuilder<LoginBtnController>(
        builder: (LoginBtnController controller) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            height: 48.h,
            child: ElevatedButton(
                onPressed: () async {
                  if(await controller.signOutWithGoogle()){
                    Get.toNamed(ROUTE_LOGIN);
                  }else{
                    ShowSnackBar('로그아웃 실패');
                  }

                },
                child: Text('로그아웃',
                    style:
                        TextStyle(color: CommonColors.white, fontSize: 18.sp)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: CommonColors.white,
                  backgroundColor: CommonColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                )),
          ))
        ],
      );
    });
  }
}

class LogoutBtnController extends GetxController {
  var dio;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();

  }

}
