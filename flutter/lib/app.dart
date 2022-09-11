import 'package:dio/dio.dart';
import 'package:event_tracker/features/login/pages/login_page.dart';
import 'package:event_tracker/features/login/repository/login_repository.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  var client = DioHttpClientService(
    Dio(),
    [LoggerInterceptor()],
    DioHttpErrorHandler(),
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LoginRepository(client),
      child: MaterialApp(
        theme: Themes.mainTheme,
        home: const LoginPage(),
      ),
    );
  }
}
