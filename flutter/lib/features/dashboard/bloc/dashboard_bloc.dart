import 'package:equatable/equatable.dart';
import 'package:event_tracker/features/dashboard/dashboard.dart';
import 'package:event_tracker/features/dashboard/models/dashboard_get_pets_list_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository repository;

  DashboardBloc({required this.repository}) : super(const DashboardState()) {
    on<DashboardDidStartPage>(_getInitialPets);
    on<DashboardDidRefresh>(_refreshPets);
  }

  void _getInitialPets(
    DashboardDidStartPage event,
    Emitter<DashboardState> emit,
  ) async {
    var newState = await _getAdoptionPetsList();
    emit(newState);
  }

  void _refreshPets(
    DashboardDidRefresh event,
    Emitter<DashboardState> emit,
  ) async {
    var newState = await _getAdoptionPetsList();
    emit(newState);
  }

  Future<DashboardState> _getAdoptionPetsList() async {
    var pets = await repository.getPetsList();
    if (pets != null) {
      var newState = state.copyWith(
        adoptViewState: DashboardAdoptViewState.success,
        pets: pets,
      );
      return newState;
    }
    return state;
  }
}
