import 'package:event_tracker/utils/utils.dart';

class PetDetailsModel implements Codable {
  PetDetailsModel({
    required this.id,
    required this.name,
    required this.type,
    required this.size,
    required this.location,
    required this.race,
    required this.sex,
    required this.isNeutered,
    required this.description,
    required this.image,
    required this.donatorEmail,
  });

  @override
  PetDetailsModel.fromJson(Map<String, dynamic> json)
      : id = json["idpets"],
        name = json["NomePet"],
        size = json["Porte"],
        type = json["Tipo"],
        location = json["Localizacao"],
        race = json["Raca"],
        sex = json["Sexo"],
        description = json["Descricao"],
        isNeutered = (json["Castrado"] == BaseStrings.newPetIsNeuteredYes),
        image = json["Imagens"],
        donatorEmail = json["fk_emailUsers"];

  final int id;
  final String name;
  final String type;
  final String size;
  final String location;
  final String race;
  final String sex;
  final bool isNeutered;
  final String description;
  final String image;
  final String donatorEmail;

  @override
  Map<String, dynamic> toJson() {
    return {
      "idpets": id,
      "NomePet": name,
      "Porte": size,
      "Tipo": type,
      "Localizacao": location,
      "Raca": race,
      "Sexo": sex,
      "Descricao": description,
      "Castrado": isNeutered
          ? BaseStrings.newPetIsNeuteredYes
          : BaseStrings.newPetIsNeuteredNo,
      "Imagens": image,
      "fk_emailUsers": donatorEmail
    };
  }
}
