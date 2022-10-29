import 'package:event_tracker/utils/utils.dart';

class LoginRequestModel implements Codable {
  LoginRequestModel({
    required this.username,
    required this.password,
  });

  @override
  LoginRequestModel.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        password = json["password"];

  final String username;
  final String password;

  @override
  Map<String, dynamic> toJson() {
    return {'email': username, 'password': password};
  }
}
