// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_server_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResServerListModel _$ResServerListModelFromJson(Map<String, dynamic> json) =>
    ResServerListModel(
      json['name'] as String,
      json['project-name'] as String,
      json['prod-health'] as String,
      json['dev-health'] as String,
    );

Map<String, dynamic> _$ResServerListModelToJson(ResServerListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'projectName': instance.projectName,
      'prodHealth': instance.prodHealth,
      'devHealth': instance.devHealth,
    };
