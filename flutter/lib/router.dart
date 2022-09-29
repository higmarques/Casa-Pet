import 'package:dio/dio.dart';
import 'package:event_tracker/features/dashboard/pages/dashboard_page.dart';
import 'package:event_tracker/features/new_pet/new_pet.dart';
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
        return _routeLogin();
      case Routes.register:
        return _routeRegister();
      case Routes.dashboard:
        return _routeDashboard();
      case Routes.newPet:
        return _routeNewPet();
      default:
        var routeName = routeSettings.name?.toUpperCase() ?? "[NULL]";
        return MaterialPageRoute(
          builder: (context) => Text(
              BaseStrings.nullRouteFeedback.replaceFirst("\$1", routeName)),
        );
    }
  }

  MaterialPageRoute<dynamic> _routeLogin() {
    return MaterialPageRoute(
      builder: (context) => RepositoryProvider(
        create: (context) => LoginRepository(client),
        child: const LoginPage(),
      ),
    );
  }

  MaterialPageRoute<dynamic> _routeRegister() {
    return MaterialPageRoute(
      builder: (context) => RepositoryProvider(
        create: (context) => RegisterRepository(client),
        child: const RegisterPage(),
      ),
    );
  }

  MaterialPageRoute<dynamic> _routeDashboard() {
    return MaterialPageRoute(
      builder: (context) => const DashboardPage(),
    );
  }

  MaterialPageRoute<dynamic> _routeNewPet() {
    return MaterialPageRoute(
      builder: (context) => RepositoryProvider(
        create: (context) => NewPetRepository(client),
        child: const NewPetPage(),
      ),
    );
  }
}
