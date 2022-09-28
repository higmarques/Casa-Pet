part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {this.name = const NameModel.pure(BaseStrings.empty),
      this.email = const EmailModel.pure(BaseStrings.empty),
      this.password = const PasswordModel.pure(BaseStrings.empty),
      this.passwordAgain = const PasswordAgainModel.pure(),
      this.formState = FormzStatus.pure,
      this.viewState = RegisterViewState.idle});

  final NameModel name;
  final EmailModel email;
  final PasswordModel password;
  final PasswordAgainModel passwordAgain;
  final FormzStatus formState;
  final RegisterViewState viewState;

  RegisterState copyWith({
    NameModel? name,
    EmailModel? email,
    PasswordModel? password,
    PasswordAgainModel? passwordAgain,
    FormzStatus? status,
    RegisterViewState? requestStatus,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordAgain: passwordAgain ?? this.passwordAgain,
      formState: status ?? this.formState,
      viewState: requestStatus ?? this.viewState,
    );
  }

  @override
  List<Object> get props => [
        name,
        email,
        password,
        passwordAgain,
        formState,
        viewState,
      ];
}
