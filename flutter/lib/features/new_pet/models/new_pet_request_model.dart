import 'package:event_tracker/utils/utils.dart';

class NewPetRequestModel implements Codable {
  NewPetRequestModel(
    this.name,
    this.type,
    this.size,
    this.location,
    this.race,
    this.sex,
    this.isNeutered,
    this.description,
    this.token,
    this.photoData,
    this.format,
  );

  @override
  NewPetRequestModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["type"],
        size = json["size"],
        location = json["location"],
        race = json["race"],
        sex = json["sex"],
        isNeutered = json["isNeutered"] == BaseStrings.newPetIsNeuteredYes,
        description = json["description"],
        token = json["token"],
        photoData = json["photoData"],
        format = json["Formato"];

  final String name;
  final String type;
  final String size;
  final String location;
  final String race;
  final String sex;
  final bool isNeutered;
  final String description;
  final String token;
  final String photoData;
  final String format;

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
      "Token": token,
      "Formato": format,
      "Dados": photoData
    };
  }
}
