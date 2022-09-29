import 'package:event_tracker/utils/utils.dart';

class NewPetRequestModel extends Codable {
  NewPetRequestModel(
    this.name,
    this.type,
    this.size,
    this.location,
    this.race,
    this.sex,
    this.isNeutered,
    this.description,
  );

  final String name;
  final String type;
  final String size;
  final String location;
  final String race;
  final String sex;
  final bool isNeutered;
  final String description;

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    var isNeuteredBool = json["isNeutered"] == BaseStrings.newPetIsNeuteredYes;
    var register = NewPetRequestModel(
      json["name"],
      json["type"],
      json["size"],
      json["location"],
      json["race"],
      json["sex"],
      isNeuteredBool,
      json["description"],
    );

    return register;
  }

  @override
  Map<String, dynamic> toJson() {
    var isNeuteredString = isNeutered
        ? BaseStrings.newPetIsNeuteredYes
        : BaseStrings.newPetIsNeuteredNo;

    return {
      "NomePet": name,
      "Porte": size,
      "Localizacao": location,
      "Raca": race,
      "Sexo": sex,
      "Descricao": description,
      "Castrado": isNeuteredString,
      "Imagens": "[NULO]",
      "Tipo": type,
    };
  }
}
