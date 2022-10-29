import 'package:formz/formz.dart';
import 'package:event_tracker/utils/utils.dart';

enum EmailValidationError { empty, invalid }

extension EmailValidationErrorExtension on EmailValidationError {
  String getErrorText() {
    switch (this) {
      case EmailValidationError.empty:
        return BaseStrings.registerEmailErrorEmpty;
      case EmailValidationError.invalid:
        return BaseStrings.registerEmailErrorInvalid;
    }
  }
}

class EmailModel extends FormzInput<String, EmailValidationError> {
  const EmailModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const EmailModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  static final _emailRegex = RegExp(
    BaseStrings.registerEmailRegex,
  );

  @override
  EmailValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return EmailValidationError.empty;
    }

    return _emailRegex.hasMatch(value ?? BaseStrings.empty)
        ? null
        : EmailValidationError.invalid;
  }
}
