import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          "YOU ARE LOGGED",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
