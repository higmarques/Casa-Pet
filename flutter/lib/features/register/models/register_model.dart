import 'package:event_tracker/utils/utils.dart';

class RegisterModel extends Codable {
  RegisterModel({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    var register = RegisterModel(
      username: json[username],
      password: json[password],
    );

    return register;
  }

  @override
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
