import 'package:event_tracker/utils/utils.dart';

class RegisterRequestModel implements Codable {
  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
  }) : super();

  @override
  RegisterRequestModel.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        email = json["email"],
        password = json["password"];

  final String username;
  final String email;
  final String password;

  @override
  Map<String, dynamic> toJson() {
    return {'nomeCompleto': username, 'email': email, 'password': password};
  }
}
