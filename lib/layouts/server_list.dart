import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/components/server_list/production.dart';
import 'package:server_manager/models/res_server_list.dart';

import '../components/emptyWidget.dart';
import '../components/login/login_btn.dart';
import '../components/server_list/develop.dart';
import '../utils/constants.dart';
import '../utils/network/network_manager.dart';
import '../utils/theme/color_manager.dart';
import '../utils/utility.dart';
import 'otp_auth.dart';

class ServerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ServerListController());
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
              icon: Icon(Icons.refresh),
              color: context.theme.colorScheme.onPrimary,
              onPressed: () async {
                Get.find<ServerListController>().getServerList();
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
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<ServerListController>().getServerList();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w,
                BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelStyle: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    labelColor: context.theme.colorScheme.onPrimary,
                    unselectedLabelStyle: context.textTheme.bodyLarge,
                    unselectedLabelColor: Colors.grey,
                    controller: Get.find<ServerListController>().tabController,
                    indicatorColor: context.theme.colorScheme.onPrimary,
                    indicatorWeight: 4,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.grey,
                    //indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    labelPadding: EdgeInsetsDirectional.fromSTEB(
                        BASIC_PADDING * 2.w,
                        0.h,
                        BASIC_PADDING * 2.w,
                        BASIC_PADDING.h),
                    tabs: [
                      Container(
                        child: Text(
                          'Production'.tr,
                        ),
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: Text(
                          'Develop'.tr,
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: CommonColors.black,
                ),
                Expanded(
                  child: TabBarView(
                    controller: Get.find<ServerListController>().tabController,
                    children: [
                      // Production(Get.find<ServerListController>().dataController),
                      // Develop(Get.find<ServerListController>().dataController),
                      setProductionList(),
                      setDevelopList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget setProductionList() {
    if (Get.find<ServerListController>().dataController != null) {
      return Production(Get.find<ServerListController>().dataController);
    } else {
      return EmptyWidget();
    }
  }

  Widget setDevelopList() {
    if (Get.find<ServerListController>().dataController != null) {
      return Develop(Get.find<ServerListController>().dataController);
    } else {
      return EmptyWidget();
    }
  }
}

class ServerListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var dio;
  var parsedData;
  var dataController;

  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800), // 탭 변경 애니메이션 시간
  );

  @override
  void onInit() async {
    super.onInit();
    //getServerList();
  }

  Future<void> getServerList() async {
    var parsedData;
    // var options = BaseOptions(
    //   baseUrl: KEY_BASE_URL,
    //   contentType: 'application/json',
    //   connectTimeout: Duration(seconds: CONNECT_TIMEOUT), // 2Min
    //   receiveTimeout: Duration(seconds: RECEIVE_TIMEOUT), // 2Min
    // );
    //
    // Dio dio = Dio(options);

    var dio;

    dio = await reqApi();

    try {
      ShowProgress(Get.context);
      final response = await dio.get(API_GET_SERVER_LIST);
      if (response.statusCode == 200) {
        parsedData =
            await jsonDecode(jsonEncode(response.data))[TAG_DATA] as List;

        dataController = parsedData
            .map((dataJson) => ResServerListModel.fromJson(dataJson))
            .toList();
        update();
      }
      Navigator.pop(Get.context!);
    } on DioException catch (e) {
      Navigator.pop(Get.context!);
      if (e.response != null) {
        ShowSnackBar(e.response?.data[TAG_ERROR][0][TAG_MSG].toString());
      }
    }
  }
}
