import 'package:equatable/equatable.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/login/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(const LoginState()) {
    on<LoginNameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginWillLogin>(_onWillLogin);
  }

  final LoginRepository loginRepository;

  void _onUsernameChanged(
    LoginNameChanged event,
    Emitter<LoginState> emit,
  ) {
    var newState = state.copyWith(username: event.username);
    emit(newState);
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    var newState = state.copyWith(password: event.password);
    emit(newState);
  }

  Future<void> _onWillLogin(
    LoginWillLogin event,
    Emitter<LoginState> emit,
  ) async {
    var response = loginRepository
        .login(LoginModel(username: state.username, password: state.password));
    print(response);
  }
}
