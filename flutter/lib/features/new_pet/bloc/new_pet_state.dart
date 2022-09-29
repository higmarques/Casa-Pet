part of 'new_pet_bloc.dart';

class NewPetState extends Equatable {
  const NewPetState(
    this.name,
    this.type,
    this.size,
    this.location,
    this.race,
    this.sex,
    this.isNeutered,
    this.description,
    this.petList,
    this.viewState,
    this.formState,
  );

  final String name;
  final String type;
  final String size;
  final String location;
  final String race;
  final String sex;
  final bool isNeutered;
  final String description;
  final NewPetReturnModel
      petList; // Vai ser usado depois para exibir a lista de pets
  final NewPetViewState viewState;
  final bool formState;

  NewPetState copyWith({
    String? name,
    String? type,
    String? size,
    String? location,
    String? race,
    String? sex,
    bool? isNeutered,
    String? description,
    NewPetReturnModel? petList,
    NewPetViewState? viewState,
    bool? formState,
  }) {
    var newState = NewPetState(
      name ?? this.name,
      type ?? this.type,
      size ?? this.size,
      location ?? this.location,
      race ?? this.race,
      sex ?? this.sex,
      isNeutered ?? this.isNeutered,
      description ?? this.description,
      petList ?? this.petList,
      viewState ?? this.viewState,
      formState ?? this.formState,
    );
    return newState;
  }

  @override
  List<Object> get props => [
        name,
        type,
        size,
        location,
        race,
        sex,
        isNeutered,
        description,
        petList,
        viewState,
        formState,
      ];
}
