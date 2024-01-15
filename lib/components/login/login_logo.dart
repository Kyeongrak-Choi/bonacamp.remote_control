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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.w,
              BASIC_PADDING * 2.h,
              0.w,
              BASIC_PADDING * 2.h),
          child: Text(
            'BONA-CAMP',
            style: context.textTheme.headlineLarge
                ?.copyWith(color: CommonColors.primary),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.w,
              0.h,
              0.w,
              BASIC_PADDING * 2.h),
          child: Text(
            'System Control',
            style: context.textTheme.headlineSmall
                ?.copyWith(color: CommonColors.navigation),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
