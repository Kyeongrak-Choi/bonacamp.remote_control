// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_server_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResServerListModel _$ResServerListModelFromJson(Map<String, dynamic> json) =>
    ResServerListModel(
      json['name'],
      json['project-name'],
      json['prod-health'],
      json['dev-health'],
      json['status'],
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ResServerListModelToJson(ResServerListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'projectName': instance.projectName,
      'prodHealth': instance.prodHealth,
      'devHealth': instance.devHealth,
      'status': instance.status,
      'id': instance.id,
    };
