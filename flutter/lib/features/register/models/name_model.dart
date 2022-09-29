import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum NameValidationError { empty }

extension NameValidationErrorExtension on NameValidationError {
  String getErrorText() {
    return BaseStrings.registerNameError;
  }
}

class NameModel extends FormzInput<String, NameValidationError> {
  const NameModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const NameModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? NameValidationError.empty : null;
  }
}
