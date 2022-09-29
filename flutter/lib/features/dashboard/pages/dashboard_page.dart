import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "AMBIENTE LOGADO",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox.square(dimension: 8.0),
            const Text(
              "LISTAR PETS",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox.square(dimension: 8.0),
            ElevatedButton(
              onPressed: () => _routeToNewPet(context),
              child: const Text("Novo Pet"),
            )
          ],
        ),
      ),
    );
  }

  void _routeToNewPet(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.newPet);
  }
}
