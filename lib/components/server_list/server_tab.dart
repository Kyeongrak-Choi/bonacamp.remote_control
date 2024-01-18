import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:server_manager/components/server_list/production.dart';

import '../../models/res_server_list.dart';
import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';
import '../../utils/theme/color_manager.dart';
import '../../utils/utility.dart';
import '../emptyWidget.dart';
import 'develop.dart';

class ServerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ServerListController());
    return GetBuilder<ServerListController>(
        builder: (ServerListController controller) {
      return Container(
        color: context.theme.canvasColor,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(BASIC_PADDING * 2.w,
              BASIC_PADDING * 2.h, BASIC_PADDING * 2.w, BASIC_PADDING * 2.h),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelStyle: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                labelColor: context.theme.colorScheme.onPrimary,
                unselectedLabelStyle: context.textTheme.bodyLarge,
                unselectedLabelColor: Colors.grey,
                controller: controller.tabController,
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
                children: <Widget>[
                  setProductionList(),
                  setDevelopList(),
                  // Production(),
                  // Develop(),
                ],
              ),
            ),
          ]),
        ),
      );
    });
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
    getServerList();
  }

  Future<void> getServerList() async {
    var parsedData;
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
