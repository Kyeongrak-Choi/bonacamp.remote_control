import 'package:json_annotation/json_annotation.dart';

part 'req_run.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ReqRunModel {
  String profile;
  String service;

  ReqRunModel(
    this.profile,
    this.service,
  ); //

  Map<String, dynamic> toMap() {
    return {
      'profile': profile,
      'service': service,
    };
  }

  factory ReqRunModel.fromJson(Map<String, dynamic> json) =>
      _$ReqRunModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqRunModelToJson(this);
}
