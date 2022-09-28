part of 'new_pet_bloc.dart';

abstract class NewPetState extends Equatable {
  const NewPetState();
  
  @override
  List<Object> get props => [];
}

class NewPetInitial extends NewPetState {}
