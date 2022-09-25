import 'package:equatable/equatable.dart';

enum LoginViewState { idle, loading, error, success }

class LoginStateModel extends Equatable {
  const LoginStateModel({this.state = LoginViewState.idle});
  const LoginStateModel.loading([this.state = LoginViewState.loading]);
  const LoginStateModel.success([this.state = LoginViewState.success]);
  const LoginStateModel.error([this.state = LoginViewState.error]);
  final LoginViewState state;

  @override
  List<Object?> get props => [state];
}
