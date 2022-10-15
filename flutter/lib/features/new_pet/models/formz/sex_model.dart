import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum SexValidationError { empty }

extension SexValidationErrorExtension on SexValidationError {
  String getErrorText() {
    return BaseStrings.newPetSexError;
  }
}

class SexModel extends FormzInput<String, SexValidationError> {
  const SexModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const SexModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  SexValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? SexValidationError.empty : null;
  }
}
