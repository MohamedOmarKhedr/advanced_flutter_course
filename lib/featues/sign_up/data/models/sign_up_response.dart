import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;
  SignUpResponse();

  factory SignUpResponse.fromJson(Map<String,dynamic> json) => _$SignUpResponseFromJson(json);

}

@JsonSerializable()
class UserData{
  String? token;
  @JsonKey(name: 'username')
  String? userName;
  UserData();

  factory UserData.fromJson(Map<String,dynamic> json) => _$UserDataFromJson(json);
}



