import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/components/otp_auth/pincode.dart';
import 'package:server_manager/utils/constants.dart';

import '../components/login/login_btn.dart';
import '../models/req_signin.dart';
import '../utils/database/hive_manager.dart';
import '../utils/utility.dart';

class OTPAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginBtnController());
    Get.put(OTPAuthController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(Hive.box(LOCAL_DB).get(KEY_SAVED_ID)),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.network(Hive.box(LOCAL_DB).get(KEY_SAVED_IMG),
                fit: BoxFit.contain),
          ),
        ),

        // backgroundColor: ,
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.person_add),
              color: context.theme.colorScheme.onPrimary,
              onPressed: () async {
                ShowProgress(context);
                if (await Get.find<OTPAuthController>().checkSignin()) {
                  Navigator.pop(context);
                  ShowSnackBar('등록요청완료\n메일 확인하여 Google OTP 등록해주세요.');
                } else {
                  Navigator.pop(context);
                  ShowSnackBar('API 호출 실패');
                }
              }),
          IconButton(
              icon: Icon(Icons.logout),
              color: context.theme.colorScheme.onPrimary,
              onPressed: () async {
                ShowProgress(context);
                if (await Get.find<LoginBtnController>().signOutWithGoogle()) {
                  Navigator.pop(context);
                  Get.toNamed(ROUTE_LOGIN);
                } else {
                  Navigator.pop(context);
                  ShowSnackBar('로그아웃 실패');
                }
              }),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w,
              BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.w,
                    0.h, 0.w, BASIC_PADDING * 3.h),
                child: Text('Google OTP 번호 6자리를 입력하세요.'),
              ),
              Pincode(),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.w,
                    0.h, 0.w, BASIC_PADDING * 3.h),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(ROUTE_SERVER_LIST);
                  },
                  child: const Text('TEST'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class OTPAuthController extends GetxController {
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