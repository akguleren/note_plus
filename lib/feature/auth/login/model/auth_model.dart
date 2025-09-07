import 'package:json_annotation/json_annotation.dart';
import 'package:note_plus/app/core/network/model/i_network_model.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends INetworkModel<AuthModel> {
  AuthModel({required this.email, required this.password});

  final String email;
  final String password;

  @override
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  @override
  AuthModel fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}
