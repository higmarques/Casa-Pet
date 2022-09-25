import 'package:dio/dio.dart';
import 'package:event_tracker/features/dashboard/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/login/login.dart';
import 'package:event_tracker/features/register/register.dart';
import 'package:event_tracker/service/http.dart';
import 'package:event_tracker/utils/utils.dart';

class AppRouter {
  var client = DioHttpClientService(
    Dio(),
    [LoggerInterceptor()],
    DioHttpErrorHandler(),
  );

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => LoginRepository(client),
            child: const LoginPage(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => RepositoryProvider(
            create: (context) => RegisterRepository(
              client,
            ),
            child: const RegisterPage(),
          ),
        );
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Text(
              "NO ROUTE WITH NAME ${routeSettings.name?.toUpperCase() ?? "[NULL]"}"),
        );
    }
  }
}
