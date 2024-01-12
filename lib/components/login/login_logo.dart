import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/theme/color_manager.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'BONABANK\nSystem Control',
          style: context.textTheme.headlineLarge
              ?.copyWith(color: CommonColors.primary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
