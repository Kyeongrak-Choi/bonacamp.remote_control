import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../components/server_list/production.dart';
import '../../components/server_list/server_tab.dart';

part 'res_server_list.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ResServerListModel {
  var name;
  var projectName;
  var prodHealth;
  var devHealth;
  var status;
  int? id;

  ResServerListModel(
      this.name, this.projectName, this.prodHealth, this.devHealth,this.status,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'project-name': projectName,
      'prod-health': projectName,
      'dev-health': devHealth,
      'status' : status,
    };
  }

  factory ResServerListModel.fromJson(Map<String, dynamic> json) =>
      _$ResServerListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResServerListModelToJson(this);

  String? get getName => name;

  set setName(String value) {
    name = value;
  }

  String? get getProjectName => projectName;

  set setProjectName(String value) {
    projectName = value;
  }

  String? get getProdHealth => prodHealth;

  set setProdHealth(String value) {
    prodHealth = value;
  }

  String? get getDevHealth => devHealth;

  set setDevHealth(String value) {
    devHealth = value;
  }
}

List<ResServerListModel> generateProdList(dataList, count) {
  //Get.put(ProductionController());
  List<ResServerListModel> prodList = [];

  for (int i = 0; i < count; i++) {
    if (dataList[i].prodHealth != '') {
      prodList.add(
          ResServerListModel(
              dataList[i].name,
              dataList[i].projectName,
              dataList[i].prodHealth,
              dataList[i].devHealth,
              //Get.find<ProductionController>().getServerHealth(dataList[i].prodHealth),
              '',
              id: i));
    }
  }
  return prodList;
}

List<ResServerListModel> generateDevList(dataList, count) {
  List<ResServerListModel> devList = [];

  for (int i = 0; i < count; i++) {
    if (dataList[i].devHealth != '') {
      devList.add(
          ResServerListModel(
              dataList[i].name,
              dataList[i].projectName,
              dataList[i].prodHealth,
              dataList[i].devHealth,
              '',
              id: i));
    }
  }

  return devList;
}

