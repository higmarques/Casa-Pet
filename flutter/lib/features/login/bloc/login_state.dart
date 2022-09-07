part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = Strings.empty,
    this.password = Strings.empty,
  });

  final String username;
  final String password;

  LoginState copyWith({
    String? username,
    String? password,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [username, password];
}