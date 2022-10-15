import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum TypeValidationError { empty }

extension TypeValidationErrorExtension on TypeValidationError {
  String getErrorText() {
    return BaseStrings.newPetTypeError;
  }
}

class TypeModel extends FormzInput<String, TypeValidationError> {
  const TypeModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const TypeModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  TypeValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? TypeValidationError.empty : null;
  }
}
