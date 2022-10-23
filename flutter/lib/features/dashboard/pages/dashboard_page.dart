import 'package:event_tracker/features/dashboard/dashboard.dart';
import 'package:event_tracker/service/session_manager.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;

part './components/dashboard_pet_cell.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        repository: RepositoryProvider.of<DashboardRepository>(context),
      ),
      child: _scaffold(context),
    );
  }

  Widget _scaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryBeige,
      appBar: AppBar(
        title: const Text(BaseStrings.dashboardAppBarTitle),
        leading: GestureDetector(
          onTap: () {
            SessionManager.clearToken();
            Navigator.pop(context);
          },
          child: Transform.rotate(
            angle: 180 * math.pi / 180,
            child: const Icon(Icons.logout),
          ),
        ),
      ),
      body: const DashboardView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _routeToNewPet(context),
        child: const Icon(
          Icons.add_rounded,
          color: BaseColors.white,
          size: 55,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        unselectedItemColor: BaseColors.primaryBeige,
        selectedItemColor: BaseColors.secondaryGreen,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: BaseStrings.dashboardBarAdopt,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: BaseStrings.dashboardBarDonate,
          )
        ],
      ),
    );
  }

  void _routeToNewPet(BuildContext context) async {
    var didRegisterNewPet =
        await Navigator.of(context).pushNamed(Routes.newPet) as bool?;
    if (didRegisterNewPet ?? false) {}
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashboardBloc>().add(DashboardDidStartPage());

    return RefreshIndicator(
      onRefresh: () => _refreshPetsList(context),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scrollbar(
            thumbVisibility: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.pets.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.pets.length) {
                    return const SizedBox(height: 65);
                  } else {
                    return DashboardPetCell(state.pets[index]);
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _refreshPetsList(BuildContext context) async {
    context.read<DashboardBloc>().add(DashboardDidRefresh());
  }
}
