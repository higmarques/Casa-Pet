import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/login/login.dart';
import 'package:event_tracker/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Titulo")),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocProvider(
        create: (context) => LoginBloc(
          RepositoryProvider.of<LoginRepository>(context),
        ),
        child: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: BaseColors.white,
            ),
          ),
          const Expanded(child: SizedBox()),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NOME
                  BaseTextField(
                    onChanged: (name) => nameChanged(
                      context.read<LoginBloc>(),
                      name,
                    ),
                    hintText: "NOME",
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      size: 24,
                      color: BaseColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // SENHA
                  BaseTextField(
                    onChanged: (name) => passwordChanged(
                      context.read<LoginBloc>(),
                      name,
                    ),
                    hintText: "SENHA",
                    obscureText: true,
                    prefixIcon: const Icon(
                      Icons.lock_outlined,
                      size: 24,
                      color: BaseColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => doLogin(context.read<LoginBloc>()),
                    child: const Text("LOGAR"),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  void nameChanged(Bloc bloc, String name) {
    bloc.add(LoginNameChanged(name));
  }

  void passwordChanged(Bloc bloc, String password) {
    bloc.add(LoginPasswordChanged(password));
  }

  void doLogin(Bloc bloc) {
    bloc.add(const LoginWillLogin());
  }
}
