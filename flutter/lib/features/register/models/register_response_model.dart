import 'package:event_tracker/utils/utils.dart';

class RegisterResponseModel implements Codable {
  RegisterResponseModel({
    required this.user,
    required this.message,
  });

  @override
  RegisterResponseModel.fromJson(Map<String, dynamic> json)
      : user = RegisterUser.fromJson(json["usuario"]),
        message = json["mensagem"];

  final RegisterUser user;
  final String message;

  @override
  Map<String, dynamic> toJson() {
    return {
      'usuario': user,
    };
  }
}

class RegisterUser implements Codable {
  final int id;
  final String name;
  final String email;
  final String password;
  final String token;

  RegisterUser.fromJson(Map<String, dynamic> json)
      : id = json["idusers"],
        name = json["nomeCompleto"],
        email = json["email"],
        password = json["password"],
        token = json["token_id"];

  @override
  Map<String, dynamic> toJson() {
    return {
      "idusers": id,
      "nomeCompleto": name,
      "email": email,
      "password": password,
      "token_id": token,
    };
  }
}
