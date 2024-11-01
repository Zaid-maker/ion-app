// SPDX-License-Identifier: ice License 1.0

import 'package:email_validator/email_validator.dart';

class Validators {
  Validators._();

  static bool isEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }

  static bool isInvalidEmail(String? value) {
    return isEmpty(value) || !EmailValidator.validate(value!);
  }

  static bool isInvalidName(String? value) {
    return isEmpty(value) || !RegExp(r'^[a-zA-Z0-9.]+$').hasMatch(value!);
  }

  static bool isInvalidLength(String? value, {int? minLength, int? maxLength}) {
    assert(
      minLength != null || maxLength != null,
      'At least one of minLength or maxLength must be provided',
    );

    if (value == null) return true;
    if (minLength != null && value.length < minLength) return true;
    if (maxLength != null && value.length > maxLength) return true;

    return false;
  }

  static bool isInvalidNumber(String? value) {
    return isEmpty(value) || double.tryParse(value!) == null;
  }
}
