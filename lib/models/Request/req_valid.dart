import 'package:json_annotation/json_annotation.dart';

part 'req_valid.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ReqValidModel {
  String code;
  String key;

  ReqValidModel(
      this.code,
      this.key,
  );

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'encoded-key' : key,
    };
  }

  factory ReqValidModel.fromJson(Map<String, dynamic> json) =>
      _$ReqValidModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqValidModelToJson(this);
}
