import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum IsNeuteredValidationError { empty }

extension IsNeuteredValidationErrorExtension on IsNeuteredValidationError {
  String getErrorText() {
    return BaseStrings.newPetNeuteredError;
  }
}

class IsNeuteredModel extends FormzInput<bool?, IsNeuteredValidationError> {
  const IsNeuteredModel.pure([super.value]) : super.pure();
  const IsNeuteredModel.dirty([super.value]) : super.dirty();

  @override
  IsNeuteredValidationError? validator(bool? value) {
    return (value == null) ? IsNeuteredValidationError.empty : null;
  }
}
