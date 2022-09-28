import 'package:event_tracker/features/register/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/register/register.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
        RepositoryProvider.of<RegisterRepository>(context),
      ),
      child: _scaffold(context),
    );
  }

  Widget _scaffold(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.requestStatus == RegisterViewState.success) {
          _routeToDashboard(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: _appBar(context),
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              List<Widget> views = [const RegisterView()];
              if (state.requestStatus == RegisterViewState.loading) {
                views.add(const LoadingView());
              }
              return Stack(children: views);
            },
          ),
          bottomSheet: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return state.requestStatus == RegisterViewState.error
                  ? ErrorBottomSheet(
                      BaseStrings.defaultRequestErrorText,
                      onTap: () => _closeError(context),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(BaseStrings.registerAppBarTitle),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  void _closeError(BuildContext context) {
    context.read<RegisterBloc>().add(const RegisterCloseError());
  }

  void _routeToDashboard(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Routes.dashboard);
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox.square(dimension: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _formNameField(),
                const SizedBox(height: 16),
                _formEmailField(),
                const SizedBox(height: 16),
                _formPasswordField(),
                const SizedBox(height: 16),
                _formPasswordAgainField(),
                const SizedBox(height: 8),
                const BaseTooltip(BaseStrings.registerFieldPasswordTooltip),
              ],
            ),
            _formRegisterButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  BlocBuilder<RegisterBloc, RegisterState> _formNameField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return BaseTextField(
          hintText: BaseStrings.registerFieldName,
          isError: state.name.invalid,
          errorText:
              state.name.error?.getErrorText() ?? BaseStrings.defaultFieldError,
          type: TextInputType.name,
          prefixIcon: const Icon(
            Icons.person_outline,
            size: 24,
            color: BaseColors.grey,
          ),
          onChanged: (name) => _nameChanged(
            context.read<RegisterBloc>(),
            name,
          ),
        );
      },
    );
  }

  BlocBuilder<RegisterBloc, RegisterState> _formEmailField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return BaseTextField(
          hintText: BaseStrings.registerFieldEmail,
          isError: state.email.invalid,
          errorText: state.email.error?.getErrorText() ??
              BaseStrings.defaultFieldError,
          type: TextInputType.emailAddress,
          prefixIcon: const Icon(
            Icons.mail_outline,
            size: 24,
            color: BaseColors.grey,
          ),
          onChanged: (name) => _emailChanged(
            context.read<RegisterBloc>(),
            name,
          ),
        );
      },
    );
  }

  BlocBuilder<RegisterBloc, RegisterState> _formPasswordField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return BaseTextField(
          hintText: BaseStrings.registerFieldPassword,
          isError: state.password.invalid,
          errorText: state.password.error?.getErrorText() ??
              BaseStrings.defaultFieldError,
          type: TextInputType.visiblePassword,
          obscureText: true,
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 24,
            color: BaseColors.grey,
          ),
          onChanged: (name) => _passwordChanged(
            context.read<RegisterBloc>(),
            name,
          ),
        );
      },
    );
  }

  BlocBuilder<RegisterBloc, RegisterState> _formPasswordAgainField() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return BaseTextField(
          hintText: BaseStrings.registerFieldPasswordAgain,
          isError: state.passwordAgain.invalid,
          errorText: state.passwordAgain.error?.getErrorText() ??
              BaseStrings.defaultFieldError,
          type: TextInputType.visiblePassword,
          obscureText: true,
          prefixIcon: const Icon(
            Icons.lock_outline,
            size: 24,
            color: BaseColors.grey,
          ),
          onChanged: (name) => _passwordAgainChanged(
            context.read<RegisterBloc>(),
            name,
          ),
        );
      },
    );
  }

  BlocBuilder<dynamic, dynamic> _formRegisterButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: state.status.isValidated
                  ? () => _doRegister(context.read<RegisterBloc>())
                  : null,
              child: const Text(BaseStrings.registerButtonRegister),
            ),
          ),
        );
      },
    );
  }

  void _nameChanged(Bloc bloc, String name) {
    bloc.add(RegisterNameChanged(name));
  }

  void _emailChanged(Bloc bloc, String email) {
    bloc.add(RegisterEmailChanged(email));
  }

  void _passwordChanged(Bloc bloc, String password) {
    bloc.add(RegisterPasswordChanged(password));
  }

  void _passwordAgainChanged(Bloc bloc, String passwordAgain) {
    bloc.add(RegisterPasswordAgainChanged(passwordAgain));
  }

  void _doRegister(Bloc bloc) {
    bloc.add(const RegisterWillRegister());
  }
}
