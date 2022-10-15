import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum SizeValidationError { empty }

extension SizeValidationErrorExtension on SizeValidationError {
  String getErrorText() {
    return BaseStrings.newPetSizeError;
  }
}

class SizeModel extends FormzInput<String, SizeValidationError> {
  const SizeModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const SizeModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  SizeValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? SizeValidationError.empty : null;
  }
}
