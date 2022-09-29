import 'package:event_tracker/features/login/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/login/login.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        repository: RepositoryProvider.of<LoginRepository>(context),
      ),
      child: _scaffold(context),
    );
  }

  Widget _scaffold(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.viewState == LoginViewState.success) {
          _routeToDashboard(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                List<Widget> views = [const LoginView()];
                if (state.viewState == LoginViewState.loading) {
                  views.add(const LoadingView());
                }

                return Stack(children: views);
              },
            ),
            bottomSheet: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return state.viewState == LoginViewState.error
                    ? ErrorBottomSheet(
                        BaseStrings.loginRequestErrorText,
                        onTap: () => _closeError(context),
                      )
                    : const SizedBox.shrink();
              },
            )),
      ),
    );
  }

  void _routeToDashboard(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.dashboard);
  }

  void _closeError(BuildContext context) {
    context.read<LoginBloc>().add(const LoginCloseError());
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
          hintText: BaseStrings.loginFieldEmail,
          type: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.mail_outline,
            size: 24,
            color: BaseColors.grey,
          ),
          onChanged: (name) => _nameChanged(
            context.read<LoginBloc>(),
            name,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          child: BaseTextField(
            hintText: BaseStrings.loginFieldPassword,
            obscureText: true,
            type: TextInputType.visiblePassword,
            prefixIcon: const Icon(
              Icons.lock_outlined,
              size: 24,
              color: BaseColors.grey,
            ),
            onChanged: (name) => _passwordChanged(
              context.read<LoginBloc>(),
              name,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () => _doLogin(context.read<LoginBloc>()),
          child: const Text(BaseStrings.loginButtonLogin),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _routeToRegister(context),
          child: const Text(BaseStrings.loginButtonRegister),
        ),
      ],
    );
  }

  void _nameChanged(Bloc bloc, String name) {
    bloc.add(LoginNameChanged(name));
  }

  void _passwordChanged(Bloc bloc, String password) {
    bloc.add(LoginPasswordChanged(password));
  }

  void _doLogin(Bloc bloc) {
    bloc.add(const LoginWillLogin());
  }

  void _routeToRegister(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.register);
  }
}
