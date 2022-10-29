import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum NamePetValidationError { empty }

extension NameValidationErrorExtension on NamePetValidationError {
  String getErrorText() {
    return BaseStrings.newPetNameError;
  }
}

class NamePetModel extends FormzInput<String, NamePetValidationError> {
  const NamePetModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const NamePetModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  NamePetValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? NamePetValidationError.empty : null;
  }
}
