abstract class Decodable {
  Decodable fromJson(Map<String, dynamic> json);
}

abstract class Encodable {
  Map<String, dynamic> toJson();
}

abstract class Codable extends Decodable with Encodable {}
