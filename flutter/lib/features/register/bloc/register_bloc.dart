import 'package:crypt/crypt.dart';
import 'package:equatable/equatable.dart';
import 'package:event_tracker/service/session_manager.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/register/register.dart';
import 'package:event_tracker/features/register/models/models.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required this.repository,
  }) : super(const RegisterState()) {
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterPasswordAgainChanged>(_onPasswordAgainChanged);
    on<RegisterWillRegister>(_onWillRegister);
    on<RegisterCloseError>(_onCloseError);
  }

  final RegisterRepository repository;

  void _onNameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    var model = NameModel.dirty(event.name);
    var newState = state.copyWith(
      name: model,
      status: _validate(name: model),
    );
    emit(newState);
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final model = EmailModel.dirty(event.email);
    var newState = state.copyWith(
      email: model,
      status: _validate(email: model),
    );
    emit(newState);
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    var model = PasswordModel.dirty(event.password);
    var newState = state.copyWith(
      password: model,
      status: _validate(password: model),
    );
    emit(newState);
  }

  void _onPasswordAgainChanged(
    RegisterPasswordAgainChanged event,
    Emitter<RegisterState> emit,
  ) {
    var model = PasswordAgainModel.dirty(state.password, event.password);
    var newState = state.copyWith(
      passwordAgain: model,
      status: _validate(passwordAgain: model),
    );
    emit(newState);
  }

  Future<void> _onWillRegister(
    RegisterWillRegister event,
    Emitter<RegisterState> emit,
  ) async {
    var loadingState = state.copyWith(
      requestStatus: RegisterViewState.loading,
    );
    emit(loadingState);

    var encryptedPassword = Crypt.sha256(
      state.password.value,
      salt: state.email.value,
      rounds: 5000,
    );

    var registerToken = await repository.register(RegisterRequestModel(
      username: state.name.value,
      password: encryptedPassword.hash,
      email: state.email.value,
    ));

    if (registerToken.isNotEmpty) {
      SessionManager.setToken(registerToken);
      var successState = state.copyWith(
        requestStatus: RegisterViewState.success,
      );
      emit(successState);
    } else {
      var errorState = state.copyWith(
        requestStatus: RegisterViewState.error,
      );
      emit(errorState);
    }
  }

  Future<void> _onCloseError(
    RegisterCloseError event,
    Emitter<RegisterState> emit,
  ) async {
    var newState = state.copyWith(requestStatus: event.state);
    emit(newState);
  }

  FormzStatus _validate({
    NameModel? name,
    EmailModel? email,
    PasswordModel? password,
    PasswordAgainModel? passwordAgain,
  }) {
    return Formz.validate([
      name ?? state.name,
      email ?? state.email,
      password ?? state.password,
      passwordAgain ?? state.passwordAgain,
    ]);
  }
}
