import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/login/login_btn.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetBuilder<LoginController>(builder: (LoginController controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginBtn(),
          ],
        ),
      );
    });
  }
}

class LoginController extends GetxController {}
