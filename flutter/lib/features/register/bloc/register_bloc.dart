import 'package:equatable/equatable.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/register/register.dart';
import 'package:event_tracker/features/register/models/models.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepository) : super(const RegisterState()) {
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterPasswordAgainChanged>(_onPasswordAgainChanged);
    on<RegisterWillRegister>(_onWillRegister);
  }

  final RegisterRepository registerRepository;

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
    var response = registerRepository.register(RegisterModel(
      username: state.name.value,
      password: state.password.value,
      email: state.email.value,
    ));
    print(response);
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
