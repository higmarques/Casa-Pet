abstract class Decodable {
  Decodable.fromJson(Map<String, dynamic> json);
  Decodable();
}

abstract class Encodable {
  Map<String, dynamic> toJson();
}

abstract class Codable implements Decodable, Encodable {}
