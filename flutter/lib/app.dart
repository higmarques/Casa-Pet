import 'package:event_tracker/router.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  var router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: BaseThemes.mainTheme,
      onGenerateRoute: router.onGenerateRoute,
      initialRoute: Routes.login,
    );
  }
}
