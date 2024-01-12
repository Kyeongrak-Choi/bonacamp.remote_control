import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/utils/utility.dart';

import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  if(await controller.signInWithGoogle()){
                    ShowSnackBar('로그인 성공');
                    Get.toNamed(ROUTE_AUTH);
                  }else{
                    ShowSnackBar('로그인 실패');
                  }

                },
                child: Text('sign in google',
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

class LoginBtnController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser;

    googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    //log('email : ' + googleUser!.email);
    //return await FirebaseAuth.instance.signInWithCredential(credential);
    if(googleUser!.email==""){
      return false;
    } else{
      await Hive.box(LOCAL_DB).put(KEY_SAVED_ID, googleUser!.email); // Id save
      return true;
    }
  }

  Future<bool> signOutWithGoogle() async {
    googleSignIn.signOut();

    return true;
  }
}
