// SPDX-License-Identifier: ice License 1.0

import 'package:ion_identity_client/ion_client.dart';
import 'package:ion_identity_client/src/auth/services/login/data_sources/login_data_source.dart';
import 'package:ion_identity_client/src/core/token_storage/token_storage.dart';
import 'package:ion_identity_client/src/signer/passkey_signer.dart';

class LoginService {
  const LoginService({
    required this.username,
    required this.signer,
    required this.dataSource,
    required this.tokenStorage,
  });

  final String username;
  final PasskeysSigner signer;
  final LoginDataSource dataSource;
  final TokenStorage tokenStorage;

  /// Logs in an existing user using the provided username, handling the necessary
  /// API interactions and storing the authentication token securely.
  ///
  /// This method performs the following steps:
  /// 1. Checks if the device can authenticate using passkeys.
  /// 2. Initiates the login process with the server.
  /// 3. Generates a passkey assertion.
  /// 4. Completes the login with the server.
  /// 5. Stores the received authentication tokens.
  ///
  /// Throws:
  /// - [PasskeyNotAvailableException] if the device cannot authenticate using passkeys.
  /// - [UnauthenticatedException] if the login credentials are invalid.
  /// - [UserDeactivatedException] if the user account has been deactivated.
  /// - [UserNotFoundException] if the user account does not exist.
  /// - [PasskeyValidationException] if the passkey validation fails.
  /// - [UnknownIonException] for any other unexpected errors during the login process.
  Future<void> loginUser() async {
    final canAuthenticate = await signer.canAuthenticate();
    if (!canAuthenticate) {
      throw const PasskeyNotAvailableException();
    }

    final challenge = await dataSource.loginInit(username: username);
    final assertion = await signer.sign(challenge);
    final tokens = await dataSource.loginComplete(
      challengeIdentifier: challenge.challengeIdentifier,
      assertion: assertion,
    );
    await tokenStorage.setTokens(
      username: username,
      newTokens: tokens,
    );
  }
}