part of 'new_pet_bloc.dart';

class NewPetState extends Equatable {
  const NewPetState({
    this.name = const NamePetModel.pure(),
    this.type = const TypeModel.pure(),
    this.size = const SizeModel.pure(),
    this.location = const LocationModel.pure(),
    this.race = const RaceModel.pure(),
    this.sex = const SexModel.pure(),
    this.isNeutered = const IsNeuteredModel.pure(),
    this.description = const DescriptionModel.pure(),
    this.petList = const NewPetReturnModel(),
    this.viewState = NewPetViewState.idle,
    this.formState = FormzStatus.pure,
  });

  final NamePetModel name;
  final TypeModel type;
  final SizeModel size;
  final LocationModel location;
  final RaceModel race;
  final SexModel sex;
  final IsNeuteredModel isNeutered;
  final DescriptionModel description;
  final NewPetReturnModel
      petList; // Vai ser usado depois para exibir a lista de pets
  final NewPetViewState viewState;
  final FormzStatus formState;

  NewPetState copyWith({
    NamePetModel? name,
    TypeModel? type,
    SizeModel? size,
    LocationModel? location,
    RaceModel? race,
    SexModel? sex,
    IsNeuteredModel? isNeutered,
    DescriptionModel? description,
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
