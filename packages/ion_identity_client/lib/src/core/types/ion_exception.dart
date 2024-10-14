// SPDX-License-Identifier: ice License 1.0

abstract class IonException implements Exception {
  const IonException([this.message]);

  final String? message;
}

class UnauthenticatedException extends IonException {
  const UnauthenticatedException() : super('User is not authenticated');
}

class UnknownIonException extends IonException {
  const UnknownIonException([super.message]);
}
