import 'package:crypt/crypt.dart';
import 'package:equatable/equatable.dart';
import 'package:event_tracker/features/login/models/models.dart';
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
    on<LoginCloseError>(_onCloseError);
  }

  final LoginRepository loginRepository;

  void _onUsernameChanged(
    LoginNameChanged event,
    Emitter<LoginState> emit,
  ) {
    var newState = state.copyWith(
      username: event.username,
      state: LoginViewState.idle,
    );
    emit(newState);
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    var newState = state.copyWith(
      password: event.password,
      state: LoginViewState.idle,
    );
    emit(newState);
  }

  Future<void> _onWillLogin(
    LoginWillLogin event,
    Emitter<LoginState> emit,
  ) async {
    var loading = state.copyWith(state: LoginViewState.loading);
    emit(loading);

    var encryptedPassword = Crypt.sha256(
      state.password,
      salt: state.username,
      rounds: 5000,
    );

    var responseDidLogin = await loginRepository.login(
      LoginModel(
        username: state.username,
        password: encryptedPassword.hash,
      ),
    );
    if (responseDidLogin) {
      var success = state.copyWith(state: LoginViewState.success);
      emit(success);
    } else {
      var error = state.copyWith(state: LoginViewState.error);
      emit(error);
    }
  }

  void _onCloseError(
    LoginCloseError event,
    Emitter<LoginState> emit,
  ) {
    var idle = state.copyWith(state: LoginViewState.idle);
    emit(idle);
  }
}
