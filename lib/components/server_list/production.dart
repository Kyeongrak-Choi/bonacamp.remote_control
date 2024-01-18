import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/utils/utility.dart';

import '../../layouts/server_list.dart';
import '../../models/res_server_list.dart';
import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';

class Production extends StatelessWidget {
  var dataList;

  Production(var model) {
    dataList = generateServerList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    //Get.put(ServerListController());
    return GetBuilder<ServerListController>(
        builder: (ServerListController controller) {
      return SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children:
              dataList.map<ExpansionPanelRadio>((ResServerListModel model) {
            return ExpansionPanelRadio(
              canTapOnHeader: true,
              value: model.id.toString(),
              backgroundColor: context.theme.cardColor,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h,
                      BASIC_PADDING * 2.w,
                      BASIC_PADDING * 2.h),
                  child: Text(
                    model.name,
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
              body: Container(
                padding: EdgeInsetsDirectional.fromSTEB(
                    BASIC_PADDING * 2.w,
                    BASIC_PADDING * 2.h,
                    BASIC_PADDING * 2.w,
                    BASIC_PADDING * 2.h),
                color: context.theme.colorScheme.background,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                            Icons.restart_alt,
                          color: Colors.blue,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.power,
                          color: Colors.green,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.stop_circle,
                          color: Colors.red,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
