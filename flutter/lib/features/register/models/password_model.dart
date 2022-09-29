import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

extension PasswordValidationErrorExtension on PasswordValidationError {
  String getErrorText() {
    switch (this) {
      case PasswordValidationError.empty:
        return BaseStrings.registerPasswordErrorEmpty;
      case PasswordValidationError.invalid:
        return BaseStrings.registerPasswordErrorInvalid;
    }
  }
}

class PasswordModel extends FormzInput<String, PasswordValidationError> {
  const PasswordModel.pure([super.value = '']) : super.pure();
  const PasswordModel.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex = RegExp(BaseStrings.registerPasswordRegex);

  @override
  PasswordValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return PasswordValidationError.empty;
    }

    return _passwordRegex.hasMatch(value ?? BaseStrings.empty)
        ? null
        : PasswordValidationError.invalid;
  }
}

enum PasswordAgainValidationError { empty, invalid }

extension PasswordAgainValidationErrorExtension
    on PasswordAgainValidationError {
  String getErrorText() {
    switch (this) {
      case PasswordAgainValidationError.empty:
        return BaseStrings.registerPasswordAgainErrorEmpty;
      case PasswordAgainValidationError.invalid:
        return BaseStrings.registerPasswordAgainErrorInvalid;
    }
  }
}

class PasswordAgainModel
    extends FormzInput<String, PasswordAgainValidationError> {
  const PasswordAgainModel.pure()
      : originalPassword = const PasswordModel.pure(),
        super.pure(BaseStrings.empty);
  const PasswordAgainModel.dirty(this.originalPassword,
      [super.value = BaseStrings.empty])
      : super.dirty();

  final PasswordModel? originalPassword;

  @override
  PasswordAgainValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return PasswordAgainValidationError.empty;
    }

    return originalPassword?.value == value
        ? null
        : PasswordAgainValidationError.invalid;
  }
}
