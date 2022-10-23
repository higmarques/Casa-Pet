import 'package:equatable/equatable.dart';
import 'package:event_tracker/features/pet_details/pet_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pet_details_event.dart';
part 'pet_details_state.dart';

class PetDetailsBloc extends Bloc<PetDetailsEvent, PetDetailsState> {
  late PetDetailsModel pet;

  PetDetailsBloc(Object? arguments) : super(const PetDetailsState()) {
    var json = arguments as Map<String, dynamic>;
    pet = PetDetailsModel.fromJson(json);

    on<PetDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
