import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum RaceValidationError { empty }

extension RaceValidationErrorExtension on RaceValidationError {
  String getErrorText() {
    return BaseStrings.newPetRaceError;
  }
}

class RaceModel extends FormzInput<String, RaceValidationError> {
  const RaceModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const RaceModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  RaceValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? RaceValidationError.empty : null;
  }
}
