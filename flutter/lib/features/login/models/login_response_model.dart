import 'package:event_tracker/utils/utils.dart';

class LoginResponseModel implements Codable {
  LoginResponseModel({
    required this.token,
  });

  @override
  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : token = json["access_token"];

  final String token;

  @override
  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
    };
  }
}
