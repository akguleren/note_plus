import 'package:json_annotation/json_annotation.dart';
import 'package:note_plus/app/core/network/model/i_network_model.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel extends INetworkModel<ChangePasswordModel> {
  ChangePasswordModel({required this.email});

  final String email;

  @override
  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);

  @override
  ChangePasswordModel fromJson(Map<String, dynamic> json) => _$ChangePasswordModelFromJson(json);

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordModelFromJson(json);
}
