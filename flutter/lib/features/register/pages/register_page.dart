import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/register/register.dart';
import 'package:event_tracker/utils/utils.dart';

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
            _registerForm(context),
            Flexible(
              flex: 8,
              child: Image.asset(BaseImages.registerImage, fit: BoxFit.contain),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _doRegister(context.read<RegisterBloc>()),
              child: const Text(BaseStrings.registerButtonRegister),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerForm(BuildContext context) {
    return Flexible(
      flex: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseTextField(
            onChanged: (name) => _nameChanged(
              context.read<RegisterBloc>(),
              name,
            ),
            hintText: BaseStrings.registerFieldName,
            prefixIcon: const Icon(
              Icons.mail_outline,
              size: 24,
              color: BaseColors.grey,
            ),
          ),
          const SizedBox(height: 16),
          BaseTextField(
            onChanged: (name) => _emailChanged(
              context.read<RegisterBloc>(),
              name,
            ),
            hintText: BaseStrings.registerFieldEmail,
            prefixIcon: const Icon(
              Icons.mail_outline,
              size: 24,
              color: BaseColors.grey,
            ),
          ),
          const SizedBox(height: 16),
          BaseTextField(
            onChanged: (name) => _passwordChanged(
              context.read<RegisterBloc>(),
              name,
            ),
            hintText: BaseStrings.registerFieldPassword,
            prefixIcon: const Icon(
              Icons.mail_outline,
              size: 24,
              color: BaseColors.grey,
            ),
          ),
          const SizedBox(height: 16),
          BaseTextField(
            onChanged: (name) => _passwordAgainChanged(
              context.read<RegisterBloc>(),
              name,
            ),
            hintText: BaseStrings.registerFieldPasswordAgain,
            prefixIcon: const Icon(
              Icons.mail_outline,
              size: 24,
              color: BaseColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _nameChanged(Bloc bloc, String name) {
    bloc.add(RegisterNameChanged(name));
  }

  void _emailChanged(Bloc bloc, String name) {
    bloc.add(RegisterNameChanged(name));
  }

  void _passwordChanged(Bloc bloc, String password) {
    bloc.add(RegisterPasswordChanged(password));
  }

  void _passwordAgainChanged(Bloc bloc, String name) {
    bloc.add(RegisterNameChanged(name));
  }

  void _doRegister(Bloc bloc) {
    bloc.add(const RegisterWillRegister());
  }
}
