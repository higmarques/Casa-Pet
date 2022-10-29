part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = BaseStrings.empty,
    this.password = BaseStrings.empty,
    this.viewState = LoginViewState.idle,
  });

  final String username;
  final String password;
  final LoginViewState viewState;

  LoginState copyWith({
    String? username,
    String? password,
    LoginViewState? state,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        viewState: state ?? viewState);
  }

  @override
  List<Object> get props => [username, password, viewState];
}
