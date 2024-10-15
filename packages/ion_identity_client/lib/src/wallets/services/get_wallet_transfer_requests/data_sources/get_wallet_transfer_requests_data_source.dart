// SPDX-License-Identifier: ice License 1.0

import 'package:dio/dio.dart';
import 'package:ion_identity_client/ion_client.dart';
import 'package:ion_identity_client/src/core/network2/network_client2.dart';
import 'package:ion_identity_client/src/core/network2/network_exception.dart';
import 'package:ion_identity_client/src/core/token_storage/token_storage.dart';
import 'package:ion_identity_client/src/core/types/request_headers.dart';
import 'package:ion_identity_client/src/wallets/exceptions/wallets_exceptions.dart';
import 'package:sprintf/sprintf.dart';

class GetWalletTransferRequestsDataSource {
  const GetWalletTransferRequestsDataSource(
    this._networkClient,
    this._tokenStorage,
  );

  final NetworkClient2 _networkClient;
  final TokenStorage _tokenStorage;

  static const walletTransfersPath = '/wallets/%s/transfers';

  Future<WalletTransferRequests> getWalletTransferRequests(
    String username,
    String walletId, {
    String? pageToken,
  }) async {
    final token = _tokenStorage.getToken(username: username);
    if (token == null) {
      throw const UnauthenticatedException();
    }

    try {
      return await _networkClient.get(
        sprintf(walletTransfersPath, [walletId]),
        headers: RequestHeaders.getAuthorizationHeader(token: token.token),
        queryParams: pageToken != null ? {'paginationToken': pageToken} : {},
        decoder: WalletTransferRequests.fromJson,
      );
    } on NetworkException catch (e) {
      if (e is RequestExecutionException && e.error is DioException) {
        final dioError = e.error as DioException;
        if (dioError.response?.statusCode == 401) {
          throw const UnauthenticatedException();
        }
        if (dioError.response?.statusCode == 404) {
          throw const WalletNotFoundException();
        }
      }
      throw const UnknownIonException();
    }
  }
}
