import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';

class Pincode extends StatelessWidget {
  const Pincode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PincodeController());
    return GetBuilder<PincodeController>(
        builder: (PincodeController controller) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: PinCodeTextField(
              autoDisposeControllers: false,
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                fieldHeight: 44,
                fieldWidth: 44,
                borderWidth: 2,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                shape: PinCodeFieldShape.box,
                activeColor: Colors.green
                //inactiveColor: FlutterFlowTheme.of(context).alternate,
                //selectedColor: FlutterFlowTheme.of(context).primary,
                //activeFillColor: FlutterFlowTheme.of(context).primaryText,
                //inactiveFillColor: FlutterFlowTheme.of(context).alternate,
                //selectedFillColor: FlutterFlowTheme.of(context).primary,
              ),
              animationDuration: Duration(milliseconds: 300),
              //backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
              //errorAnimationController: errorController,
             // controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);

              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
            ),
          ),
        ],
      );
    });
  }
}

class PincodeController extends GetxController {
  var dio;

  @override
  void onInit() {
    super.onInit();
  }
}
