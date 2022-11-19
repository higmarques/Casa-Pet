part of 'new_pet_bloc.dart';

abstract class NewPetEvent extends Equatable {
  const NewPetEvent();

  @override
  List<Object> get props => [];
}

class NewPetNameChanged extends NewPetEvent {
  const NewPetNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class NewPetTypeChanged extends NewPetEvent {
  const NewPetTypeChanged(this.type);

  final String type;

  @override
  List<Object> get props => [type];
}

class NewPetSizeChanged extends NewPetEvent {
  const NewPetSizeChanged(this.size);

  final String size;

  @override
  List<Object> get props => [size];
}

class NewPetLocationChanged extends NewPetEvent {
  const NewPetLocationChanged(this.location);

  final String location;

  @override
  List<Object> get props => [location];
}

class NewPetRaceChanged extends NewPetEvent {
  const NewPetRaceChanged(this.race);

  final String race;

  @override
  List<Object> get props => [race];
}

class NewPetSexChanged extends NewPetEvent {
  const NewPetSexChanged(this.sex);

  final String sex;

  @override
  List<Object> get props => [sex];
}

class NewPetIsNeuteredChanged extends NewPetEvent {
  const NewPetIsNeuteredChanged(this.isNeutered);

  final bool isNeutered;

  @override
  List<Object> get props => [isNeutered];
}

class NewPetDescriptionChanged extends NewPetEvent {
  const NewPetDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class NewPetImageRecieved extends NewPetEvent {
  const NewPetImageRecieved(this.file, this.type);

  final String file;
  final String type;

  @override
  List<Object> get props => [file, type];
}

class NewPetViewChanged extends NewPetEvent {
  const NewPetViewChanged(this.viewState);

  final String viewState;

  @override
  List<Object> get props => [viewState];
}

class NewPetCreatePet extends NewPetEvent {
  const NewPetCreatePet();
}
