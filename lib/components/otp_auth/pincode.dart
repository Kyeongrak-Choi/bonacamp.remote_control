import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:server_manager/models/Request/req_valid.dart';
import 'package:server_manager/utils/utility.dart';

import '../../utils/constants.dart';

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
              onCompleted: (pincode) async {
                log('pincode : ' + pincode);
                if(await controller.checkValid(pincode)){
                  Get.toNamed(ROUTE_SERVER_LIST);
                }

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


  Future<bool> checkValid(pincode) async {
    var options = BaseOptions(
      baseUrl: KEY_BASE_URL,
      contentType: 'application/json',
      connectTimeout: Duration(seconds: CONNECT_TIMEOUT), // 2Min
      receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 2Min
    );

    Dio dio = Dio(options);
    try {
      final response = await dio.post(KEY_BASE_URL + API_VALID,
          data: ReqValidModel(pincode,Hive.box(LOCAL_DB).get(KEY_SAVED_CODE))
              .toMap());

      if (response.data[TAG_DATA]) {
        return true;
      }else{
        ShowSnackBar('인증에 실패 하셨습니다.');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return false;
      }
    }
    return false;
  }
}
