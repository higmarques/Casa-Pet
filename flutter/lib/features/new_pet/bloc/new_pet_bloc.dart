import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_pet_event.dart';
part 'new_pet_state.dart';

class NewPetBloc extends Bloc<NewPetEvent, NewPetState> {
  NewPetBloc() : super(NewPetInitial()) {
    on<NewPetEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
