// SPDX-License-Identifier: ice License 1.0

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ion_identity_client/src/wallets/models/requester.dart';

part 'generate_signature_response.freezed.dart';
part 'generate_signature_response.g.dart';

@freezed
class GenerateSignatureResponse with _$GenerateSignatureResponse {
  const factory GenerateSignatureResponse({
    required String id,
    required String walletId,
    required String network,
    required Requester requester,
    required Map<String, dynamic> requestBody,
    required String status,
    required Map<String, dynamic> signature,
    required DateTime dateRequested,
    required DateTime dateSigned,
  }) = _GenerateSignatureResponse;

  factory GenerateSignatureResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateSignatureResponseFromJson(json);
}