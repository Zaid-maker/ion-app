// SPDX-License-Identifier: ice License 1.0

import 'package:ion/app/features/auth/providers/auth_provider.dart';
import 'package:ion/app/services/ion_identity_client/ion_identity_client_provider.dart';
import 'package:ion_identity_client/ion_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_recovery_key_action_notifier.g.dart';

@riverpod
class CreateRecoveryKeyActionNotifier extends _$CreateRecoveryKeyActionNotifier {
  @override
  FutureOr<CreateRecoveryCredentialsSuccess?> build() {
    return null;
  }

  Future<void> createRecoveryCredentials() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final selectedUser = ref.read(authProvider).valueOrNull?.currentIdentityKeyName;
      if (selectedUser == null) {
        throw Exception('No selected user');
      }

      final ionClient = await ref.read(ionApiClientProvider.future);
      return ionClient(username: selectedUser).auth.createRecoveryCredentials();
    });
  }
}
