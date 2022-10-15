import 'package:event_tracker/utils/utils.dart';
import 'package:formz/formz.dart';

enum DescriptionValidationError { tooLarge }

extension DescriptionValidationErrorExtension on DescriptionValidationError {
  String getErrorText() {
    return BaseStrings.newPetDescriptionError;
  }
}

class DescriptionModel extends FormzInput<String, DescriptionValidationError> {
  const DescriptionModel.pure([super.value = BaseStrings.empty]) : super.pure();
  const DescriptionModel.dirty([super.value = BaseStrings.empty])
      : super.dirty();

  @override
  DescriptionValidationError? validator(String? value) {
    final lenght = value?.length ?? 0;
    return (lenght > 250) ? DescriptionValidationError.tooLarge : null;
  }
}
