import 'package:event_tracker/utils/utils.dart';

class RegisterResponseModel implements Codable {
  RegisterResponseModel({
    required this.token,
  });

  @override
  RegisterResponseModel.fromJson(Map<String, dynamic> json)
      : token = json["access_token"];

  final String token;

  @override
  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
    };
  }
}
