import 'package:json_annotation/json_annotation.dart';

part 'req_health.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ReqHealthModel {
  String url;

  ReqHealthModel(
    this.url,
  ); //

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory ReqHealthModel.fromJson(Map<String, dynamic> json) =>
      _$ReqHealthModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqHealthModelToJson(this);
}
