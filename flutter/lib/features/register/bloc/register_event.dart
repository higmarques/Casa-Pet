part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterNameChanged extends RegisterEvent {
  const RegisterNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterPasswordAgainChanged extends RegisterEvent {
  const RegisterPasswordAgainChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterWillRegister extends RegisterEvent {
  const RegisterWillRegister();
}

class RegisterCloseError extends RegisterEvent {
  const RegisterCloseError([this.state = RegisterStateModel.idle]);

  final RegisterStateModel state;

  @override
  List<Object> get props => [state];
}
