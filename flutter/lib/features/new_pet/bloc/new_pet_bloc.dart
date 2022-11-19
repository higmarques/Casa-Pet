import 'dart:convert';
import 'dart:math';

import 'package:event_tracker/features/new_pet/new_pet.dart';
import 'package:event_tracker/service/session_manager.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_tracker/features/new_pet/models/models.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

part 'new_pet_event.dart';
part 'new_pet_state.dart';

class NewPetBloc extends Bloc<NewPetEvent, NewPetState> {
  NewPetBloc({
    required this.repository,
  }) : super(
          const NewPetState(),
        ) {
    on<NewPetNameChanged>(_onNameChanged);
    on<NewPetTypeChanged>(_onTypeChanged);
    on<NewPetSizeChanged>(_onSizeChanged);
    on<NewPetLocationChanged>(_onLocationChanged);
    on<NewPetRaceChanged>(_onRaceChanged);
    on<NewPetSexChanged>(_onSexChanged);
    on<NewPetIsNeuteredChanged>(_onIsNeuteredChanged);
    on<NewPetDescriptionChanged>(_onDescriptionChanged);
    on<NewPetImageRecieved>(_onImageRecieved);
    on<NewPetViewChanged>(_onViewChanged);
    on<NewPetCreatePet>(_onCreatePet);
  }

  final NewPetRepository repository;

  void _onNameChanged(
    NewPetNameChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = NamePetModel.dirty(event.name);
    var newState = state.copyWith(
      name: model,
      formState: _validate(name: model),
    );
    emit(newState);
  }

  void _onTypeChanged(
    NewPetTypeChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = TypeModel.dirty(event.type);
    var newState = state.copyWith(
      type: model,
      formState: _validate(type: model),
    );
    emit(newState);
  }

  void _onSizeChanged(
    NewPetSizeChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = SizeModel.dirty(event.size);
    var newState = state.copyWith(
      size: model,
      formState: _validate(size: model),
    );
    emit(newState);
  }

  void _onLocationChanged(
    NewPetLocationChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = LocationModel.dirty(event.location);
    var newState = state.copyWith(
      location: model,
      formState: _validate(location: model),
    );
    emit(newState);
  }

  void _onRaceChanged(
    NewPetRaceChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = RaceModel.dirty(event.race);
    var newState = state.copyWith(
      race: model,
      formState: _validate(race: model),
    );
    emit(newState);
  }

  void _onSexChanged(
    NewPetSexChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = SexModel.dirty(event.sex);
    var newState = state.copyWith(
      sex: model,
      formState: _validate(sex: model),
    );
    emit(newState);
  }

  void _onIsNeuteredChanged(
    NewPetIsNeuteredChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = IsNeuteredModel.dirty(event.isNeutered);
    var newState = state.copyWith(
      isNeutered: model,
      formState: _validate(isNeutered: model),
    );
    emit(newState);
  }

  void _onDescriptionChanged(
    NewPetDescriptionChanged event,
    Emitter<NewPetState> emit,
  ) {
    var model = DescriptionModel.dirty(event.description);
    var newState = state.copyWith(
      description: model,
      formState: _validate(description: model),
    );
    emit(newState);
  }

  void _onImageRecieved(
    NewPetImageRecieved event,
    Emitter<NewPetState> emit,
  ) async {
    // String base64Image = "data:image/png;base64," + base64Encode(file);
    var newState = state.copyWith(
      image: event.file,
      imageType: event.type,
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
  ) async {
    var response = await repository.register(
      NewPetRequestModel(
        state.name.value,
        state.type.value,
        state.size.value,
        state.location.value,
        state.race.value,
        state.sex.value,
        state.isNeutered.value!,
        state.description.value,
        SessionManager.getToken(),
        state.image,
        state.imageType,
      ),
    );
    if (response) {
      emit(state.copyWith(viewState: NewPetViewState.success));
    }
  }

  FormzStatus _validate({
    NamePetModel? name,
    TypeModel? type,
    SizeModel? size,
    LocationModel? location,
    RaceModel? race,
    SexModel? sex,
    IsNeuteredModel? isNeutered,
    DescriptionModel? description,
  }) {
    return Formz.validate([
      name ?? state.name,
      type ?? state.type,
      size ?? state.size,
      location ?? state.location,
      race ?? state.race,
      sex ?? state.sex,
      isNeutered ?? state.isNeutered,
      description ?? state.description,
    ]);
  }
}
