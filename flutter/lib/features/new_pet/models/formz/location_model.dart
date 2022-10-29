import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum LocationValidationError { empty }

extension LocationValidationErrorExtension on LocationValidationError {
  String getErrorText() {
    return BaseStrings.newPetLocationError;
  }
}

class LocationModel extends FormzInput<String, LocationValidationError> {
  const LocationModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const LocationModel.dirty([super.value = BaseStrings.empty]) : super.dirty();

  @override
  LocationValidationError? validator(String? value) {
    return (value?.isEmpty ?? true) ? LocationValidationError.empty : null;
  }
}
