import 'package:json_annotation/json_annotation.dart';

part 'req_signin.g.dart'; // *.g.dart : in same directory

// Login Request Model
@JsonSerializable(explicitToJson: true)
class ReqSigninModel {
  String email;

  ReqSigninModel(
    this.email,
  ); //

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory ReqSigninModel.fromJson(Map<String, dynamic> json) =>
      _$ReqSigninModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqSigninModelToJson(this);
}
