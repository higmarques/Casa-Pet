import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => LoginView());
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
        child: LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  LoginView({super.key});

  LoginBloc? bloc;

  @override
  Widget build(BuildContext context) {
    bloc = context.read<LoginBloc>();
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Expanded(child: SizedBox()),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // NOME
                SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: (name) => nameChanged(name),
                    decoration: const InputDecoration(hintText: "NOME"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // SENHA
                SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: (password) => passwordChanged(password),
                    decoration: const InputDecoration(hintText: "SENHA"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: doLogin,
                  child: const Text("LOGAR"),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  void nameChanged(String name) {
    print(bloc);
    bloc?.add(LoginNameChanged(name));
  }

  void passwordChanged(String password) {
    bloc?.add(LoginPasswordChanged(password));
  }

  void doLogin() {
    bloc?.add(const LoginWillLogin());
  }
}
