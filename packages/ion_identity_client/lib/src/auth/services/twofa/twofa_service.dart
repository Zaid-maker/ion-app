// SPDX-License-Identifier: ice License 1.0

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:ion_identity_client/ion_identity.dart';
import 'package:ion_identity_client/src/auth/services/extract_user_id/extract_user_id_service.dart';
import 'package:ion_identity_client/src/auth/services/twofa/data_sources/twofa_data_source.dart';
import 'package:ion_identity_client/src/wallets/ion_identity_wallets.dart';

class TwoFAService {
  const TwoFAService({
    required this.username,
    required TwoFADataSource dataSource,
    required IONIdentityWallets wallets,
    required ExtractUserIdService extractUserIdService,
  })  : _dataSource = dataSource,
        _wallets = wallets,
        _extractUserIdService = extractUserIdService;

  final String username;
  final TwoFADataSource _dataSource;
  final IONIdentityWallets _wallets;
  final ExtractUserIdService _extractUserIdService;

  Future<void> requestTwoFACode({
    required TwoFAType twoFAType,
    required Map<String, String>? verificationCodes,
  }) async {
    final userId = _extractUserIdService.extractUserId(username: username);
    final base64Signature = await _generateSignature(userId);

    await _dataSource.requestTwoFACode(
      signature: base64Signature,
      username: username,
      userId: userId,
      twoFAOption: twoFAType.option,
      verificationCodes: verificationCodes,
      email: twoFAType.emailOrNull,
      phoneNumber: twoFAType.phoneNumberOrNull,
    );
  }

  Future<void> verifyTwoFA(TwoFAType twoFAType) async {
    final userId = _extractUserIdService.extractUserId(username: username);

    await _dataSource.verifyTwoFA(
      username: username,
      userId: userId,
      twoFAOption: twoFAType.option,
      code: twoFAType.value!,
    );
  }

  Future<String> _generateSignature(String userId) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final mainWallet = (await _wallets.getWallets()).first;

    final hash = sha256.convert(utf8.encode('$timestamp:$userId'));

    final signatureResponse = await _wallets.generateHashSignature(
      mainWallet.id,
      hash.toString(),
    );

    final signature = signatureResponse.signature['encoded'].toString().substring(2);

    final base64Signature = base64Encode(utf8.encode('$signature:$timestamp:$userId'));

    return base64Signature;
  }
}
