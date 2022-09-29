import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_tracker/features/new_pet/models/models.dart';

part 'new_pet_event.dart';
part 'new_pet_state.dart';

class NewPetBloc extends Bloc<NewPetEvent, NewPetState> {
  NewPetBloc()
      : super(NewPetState(
          BaseStrings.empty,
          BaseStrings.empty,
          BaseStrings.empty,
          BaseStrings.empty,
          BaseStrings.empty,
          BaseStrings.empty,
          false,
          BaseStrings.empty,
          NewPetReturnModel(),
          NewPetViewState.idle,
          false,
        )) {
    on<NewPetNameChanged>(_onNameChanged);
    on<NewPetTypeChanged>(_onTypeChanged);
    on<NewPetSizeChanged>(_onSizeChanged);
    on<NewPetLocationChanged>(_onLocationChanged);
    on<NewPetRaceChanged>(_onRaceChanged);
    on<NewPetSexChanged>(_onSexChanged);
    on<NewPetIsNeuteredChanged>(_onIsNeuteredChanged);
    on<NewPetDescriptionChanged>(_onDescriptionChanged);
    on<NewPetViewChanged>(_onViewChanged);
    on<NewPetCreatePet>(_onCreatePet);
  }

  void _onNameChanged(
    NewPetNameChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      name: event.name,
      formState: _validate(name: event.name),
    );
    emit(newState);
  }

  void _onTypeChanged(
    NewPetTypeChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      type: event.type,
      formState: _validate(type: event.type),
    );
    emit(newState);
  }

  void _onSizeChanged(
    NewPetSizeChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      size: event.size,
      formState: _validate(size: event.size),
    );
    emit(newState);
  }

  void _onLocationChanged(
    NewPetLocationChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      location: event.location,
      formState: _validate(location: event.location),
    );
    emit(newState);
  }

  void _onRaceChanged(
    NewPetRaceChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      race: event.race,
      formState: _validate(race: event.race),
    );
    emit(newState);
  }

  void _onSexChanged(
    NewPetSexChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      sex: event.sex,
      formState: _validate(sex: event.sex),
    );
    emit(newState);
  }

  void _onIsNeuteredChanged(
    NewPetIsNeuteredChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      isNeutered: event.isNeutered,
      formState: _validate(),
    );
    emit(newState);
  }

  void _onDescriptionChanged(
    NewPetDescriptionChanged event,
    Emitter<NewPetState> emit,
  ) {
    var newState = state.copyWith(
      description: event.description,
      formState: _validate(description: event.description),
    );
    emit(newState);
  }

  void _onViewChanged(
    NewPetViewChanged event,
    Emitter<NewPetState> emit,
  ) {}

  void _onCreatePet(
    NewPetCreatePet event,
    Emitter<NewPetState> emit,
  ) {}

  bool _validate({
    String? name,
    String? type,
    String? size,
    String? location,
    String? race,
    String? sex,
    String? description,
  }) {
    var isAnyEmpty = (name ?? state.name).isEmpty ||
        (type ?? state.type).isEmpty ||
        (size ?? state.size).isEmpty ||
        (location ?? state.location).isEmpty ||
        (race ?? state.race).isEmpty ||
        (sex ?? state.sex).isEmpty;
    return !isAnyEmpty;
  }
}
