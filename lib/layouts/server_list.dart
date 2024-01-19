import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:server_manager/components/server_list/server_tab.dart';

import '../components/login/login_btn.dart';
import '../components/server_list/develop.dart';
import '../components/server_list/production.dart';
import '../utils/constants.dart';
import '../utils/utility.dart';

class ServerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get.put(ServerListController());
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
                Get.find<ProductionController>().reload();
                Get.find<DevelopController>().reload();
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ServerTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }


}


