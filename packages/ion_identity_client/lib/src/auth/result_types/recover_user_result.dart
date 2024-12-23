// SPDX-License-Identifier: ice License 1.0

sealed class RecoverUserResult {
  const RecoverUserResult();
}

class RecoverUserSuccess extends RecoverUserResult {
  const RecoverUserSuccess();
}

sealed class RecoverUserFailure extends RecoverUserResult {
  const RecoverUserFailure(this.error, this.stackTrace);

  final Object? error;
  final StackTrace? stackTrace;
}

class CreateChallengeRequestRecoverUserFailure extends RecoverUserFailure {
  const CreateChallengeRequestRecoverUserFailure() : super(null, null);
}

class SignChallengeRecoverUserFailure extends RecoverUserFailure {
  const SignChallengeRecoverUserFailure(super.error, super.stackTrace);
}

class SignNewCredentialsRecoverUserFailure extends RecoverUserFailure {
  const SignNewCredentialsRecoverUserFailure(super.error, super.stackTrace);
}

class RecoverUserRequestRecoverUserFailure extends RecoverUserFailure {
  const RecoverUserRequestRecoverUserFailure() : super(null, null);
}
