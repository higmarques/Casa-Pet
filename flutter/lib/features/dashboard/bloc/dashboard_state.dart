part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.adoptViewState = DashboardAdoptViewState.idle,
    this.donateViewState = DashboardDonateViewState.idle,
    this.pets = const [],
    this.tabIndex = 0,
  });

  final DashboardAdoptViewState adoptViewState;
  final DashboardDonateViewState donateViewState;
  final List<DashboardPet> pets;
  final int tabIndex;

  DashboardState copyWith(
      {DashboardAdoptViewState? adoptViewState,
      DashboardDonateViewState? donateViewState,
      List<DashboardPet>? pets,
      int? tabIndex}) {
    return DashboardState(
      adoptViewState: adoptViewState ?? this.adoptViewState,
      donateViewState: donateViewState ?? this.donateViewState,
      pets: pets ?? this.pets,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [adoptViewState, pets];
}
