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
          children: [
            const Text(
              "YOU ARE LOGGED",
              style: TextStyle(fontSize: 40),
            ),
            const TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
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
    Navigator.of(context).pushNamed(Routes.dashboard);
  }
}
