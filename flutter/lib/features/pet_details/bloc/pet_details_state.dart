part of 'pet_details_bloc.dart';

class PetDetailsState extends Equatable {
  const PetDetailsState({
    this.isAdopting = false,
  });

  final bool isAdopting;

  @override
  List<Object> get props => [isAdopting];
}
