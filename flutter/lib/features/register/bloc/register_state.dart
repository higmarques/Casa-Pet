part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.username = BaseStrings.empty,
    this.password = BaseStrings.empty,
  });

  final String username;
  final String password;

  RegisterState copyWith({
    String? username,
    String? password,
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [username, password];
}
