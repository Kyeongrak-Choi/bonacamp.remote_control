import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:server_manager/components/server_list/server_tab.dart';

import '../../models/Request/req_health.dart';
import '../../models/Response/res_server_list.dart';
import '../../utils/constants.dart';
import '../../utils/network/network_manager.dart';

class Develop extends StatelessWidget {
  var dataList;

  Develop(var model) {
    dataList = generateDevList(model, model.length);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ServerListController());
    Get.put(DevelopController(dataList));
    return GetBuilder<ServerListController>(
        builder: (ServerListController controller) {
      return SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 0.0,
          animationDuration: Duration(milliseconds: 500),
          children:
          Get.find<DevelopController>().data.map<ExpansionPanelRadio>((ResServerListModel model) {
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
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: model.status == 'UP' ? Colors.green : Colors.red,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        model.name,
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
                          CupertinoIcons.refresh_circled_solid,
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
                          CupertinoIcons.arrow_right_circle_fill,
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

class DevelopController extends GetxController {
  var dio;
  var data;

  DevelopController(dataList) {
    data = dataList;
  }

  @override
  void onInit() {
    super.onInit();
    reload();
  }

  Future<void> reload() async {
    await Future.delayed(Duration(seconds: 2));
    for(int i=0; i<data.length; i++  ){
      data[i].status = await getServerHealth(data[i].prodHealth);
    }
    update();
    Get.find<ServerListController>().getServerList();
  }

  Future<String> getServerHealth(String url) async {
    dio = await reqApi();
    try {
      final response = await dio.post(KEY_BASE_URL + API_GET_HEALTH,
          data: ReqHealthModel(url).toMap());
      if (response.statusCode == 200) {
        return  response.data[TAG_DATA];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return '에러발생';
      }
    }
    return '에러발생';
  }

}
