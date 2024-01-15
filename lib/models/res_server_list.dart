import 'package:json_annotation/json_annotation.dart';

part 'res_server_list.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ResServerListModel {
  var name;
  var projectName;
  var prodHealth;
  var devHealth;
  int? id;

  ResServerListModel(
      this.name, this.projectName, this.prodHealth, this.devHealth,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'project-name': projectName,
      'prod-health': projectName,
      'dev-health': devHealth,
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

List<ResServerListModel> generateServerList(dataList, count) {
  return List.generate(
      count,
      (index) => ResServerListModel(
          dataList[index].name,
          dataList[index].projectName,
          dataList[index].prodHealth,
          dataList[index].devHealth,
          id: index));
}
