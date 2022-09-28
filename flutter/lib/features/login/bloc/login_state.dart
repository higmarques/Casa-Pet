part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = BaseStrings.empty,
    this.password = BaseStrings.empty,
    this.state = LoginViewState.idle,
  });

  final String username;
  final String password;
  final LoginViewState state;

  LoginState copyWith({
    String? username,
    String? password,
    LoginViewState? state,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        state: state ?? this.state);
  }

  @override
  List<Object> get props => [username, password, state];
}
