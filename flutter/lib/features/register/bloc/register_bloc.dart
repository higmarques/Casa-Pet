import 'package:equatable/equatable.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_tracker/features/register/register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepository) : super(const RegisterState()) {
    on<RegisterNameChanged>(_onUsernameChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterWillRegister>(_onWillRegister);
  }

  final RegisterRepository registerRepository;

  void _onUsernameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    var newState = state.copyWith(username: event.username);
    emit(newState);
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    var newState = state.copyWith(password: event.password);
    emit(newState);
  }

  Future<void> _onWillRegister(
    RegisterWillRegister event,
    Emitter<RegisterState> emit,
  ) async {
    var response = registerRepository.register(
        RegisterModel(username: state.username, password: state.password));
    print(response);
  }
}
