import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/models/req_signin.dart';

import '../../utils/constants.dart';
import '../../utils/database/hive_manager.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';
import '../../utils/utility.dart';

class SigninBtn extends StatelessWidget {
  const SigninBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SigninBtnController());
    return GetBuilder<SigninBtnController>(
        builder: (SigninBtnController controller) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            height: 48.h,
            child: ElevatedButton(
                onPressed: () async {
                  controller.checkSignin();
                },
                child: Text('sign in',
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

class SigninBtnController extends GetxController {
  var dio;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> checkSignin() async {
    //dio = await reqSignin();

    var options = BaseOptions(
      baseUrl: KEY_BASE_URL,
      contentType: 'application/json',
      connectTimeout: Duration(seconds: CONNECT_TIMEOUT), // 2Min
      receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 2Min
    );

    Dio dio = Dio(options);
    try {
      final response = await dio.post(KEY_BASE_URL + API_SIGN_IN,
          data: ReqSigninModel(Hive.box(LOCAL_DB).get(KEY_SAVED_ID)).toMap());
      if (response.statusCode == 200) {
        BoxInit(); // local DB Set
        log('key : ' + response.data[TAG_DATA]);
        await Hive.box(LOCAL_DB).put(Hive.box(LOCAL_DB).get(KEY_SAVED_ID), response.data[TAG_DATA]); // save key
        return true;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return false;
      }
    }
    return false;
  }
}
