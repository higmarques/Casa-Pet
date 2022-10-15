part of 'new_pet_bloc.dart';

class NewPetState extends Equatable {
  const NewPetState({
    this.name = BaseStrings.empty,
    this.type = BaseStrings.empty,
    this.size = BaseStrings.empty,
    this.location = BaseStrings.empty,
    this.race = BaseStrings.empty,
    this.sex = BaseStrings.empty,
    this.isNeutered = false,
    this.description = BaseStrings.empty,
    this.petList = const NewPetReturnModel(),
    this.viewState = NewPetViewState.idle,
    this.formState = FormzStatus.pure,
  });

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
  final FormzStatus formState;

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
    FormzStatus? formState,
  }) {
    var newState = NewPetState(
      name: name ?? this.name,
      type: type ?? this.type,
      size: size ?? this.size,
      location: location ?? this.location,
      race: race ?? this.race,
      sex: sex ?? this.sex,
      isNeutered: isNeutered ?? this.isNeutered,
      description: description ?? this.description,
      petList: petList ?? this.petList,
      viewState: viewState ?? this.viewState,
      formState: formState ?? this.formState,
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
