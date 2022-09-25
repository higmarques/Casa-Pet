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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _appBar(context),
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: const RegisterView(),
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
                const PasswordTooltip(),
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
              state.name.error?.getErrorText() ?? BaseStrings.defaultError,
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
          errorText:
              state.email.error?.getErrorText() ?? BaseStrings.defaultError,
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
          errorText:
              state.password.error?.getErrorText() ?? BaseStrings.defaultError,
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
              BaseStrings.defaultError,
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

class PasswordTooltip extends StatelessWidget {
  const PasswordTooltip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          BaseStrings.registerFieldPasswordTooltip,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
