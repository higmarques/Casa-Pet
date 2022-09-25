import 'package:event_tracker/utils/utils.dart';

class LoginModel extends Codable {
  LoginModel({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    var login = LoginModel(
      username: json[username],
      password: json[password],
    );

    return login;
  }

  @override
  Map<String, dynamic> toJson() {
    return {'email': username, 'password': password};
  }
}
