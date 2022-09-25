part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState(
      {this.name = const NameModel.pure(BaseStrings.empty),
      this.email = const EmailModel.pure(BaseStrings.empty),
      this.password = const PasswordModel.pure(BaseStrings.empty),
      this.passwordAgain = const PasswordAgainModel.pure(),
      this.status = FormzStatus.pure});

  final NameModel name;
  final EmailModel email;
  final PasswordModel password;
  final PasswordAgainModel passwordAgain;
  final FormzStatus status;

  RegisterState copyWith({
    NameModel? name,
    EmailModel? email,
    PasswordModel? password,
    PasswordAgainModel? passwordAgain,
    FormzStatus? status,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordAgain: passwordAgain ?? this.passwordAgain,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [name, email, password, passwordAgain];
}
