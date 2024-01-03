import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager/components/otp_auth/pincode.dart';

import '../components/login/login_btn.dart';

class OTPAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pincode()
            ],
          ),
        ),
      ),
    );
  }
}