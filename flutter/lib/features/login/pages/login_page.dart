import 'package:event_tracker/utils/base_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/login/login.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(BaseImages.loginTitle),
              const Expanded(flex: 1, child: SizedBox()),
              Flexible(
                flex: 6,
                child: Image.asset(BaseImages.loginCenterImage,
                    fit: BoxFit.contain),
              ),
              Flexible(flex: 10, child: _loginForm(context)),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Column _loginForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          onChanged: (name) => nameChanged(
            context.read<LoginBloc>(),
            name,
          ),
          hintText: BaseStrings.loginFieldEmail,
          prefixIcon: const Icon(
            Icons.mail_outline,
            size: 24,
            color: BaseColors.grey,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          child: BaseTextField(
            onChanged: (name) => passwordChanged(
              context.read<LoginBloc>(),
              name,
            ),
            hintText: BaseStrings.loginFieldPassword,
            obscureText: true,
            prefixIcon: const Icon(
              Icons.lock_outlined,
              size: 24,
              color: BaseColors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () => doLogin(context.read<LoginBloc>()),
          child: const Text(BaseStrings.loginButtonLogin),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => doLogin(context.read<LoginBloc>()),
          child: const Text(BaseStrings.loginButtonRegister),
        ),
      ],
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
