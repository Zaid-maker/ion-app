// SPDX-License-Identifier: ice License 1.0

import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/features/auth/providers/auth_provider.dart';
import 'package:ion/app/features/user/providers/user_followers_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_following_provider.g.dart';

@Riverpod(keepAlive: true)
class UserFollowing extends _$UserFollowing {
  @override
  Future<Set<String>> build(String pubKey) async {
    await Future<void>.delayed(Duration(milliseconds: Random().nextInt(500) + 300));
    return {};
  }

  Future<void> toggleFollow(String pubKey) async {
    final stateValue = state.valueOrNull;
    if (stateValue == null) return;

    if (stateValue.contains(pubKey)) {
      state = AsyncValue.data({...stateValue}..remove(pubKey));
    } else {
      state = AsyncValue.data({...stateValue}..add(pubKey));
    }
  }
}

@riverpod
bool isCurrentUserFollowingSelector(Ref ref, String pubKey) {
  final identityKeyName = ref.watch(currentIdentityKeyNameSelectorProvider) ?? '';
  return ref.watch(
    userFollowingProvider(identityKeyName)
        .select((state) => state.valueOrNull?.contains(pubKey) ?? false),
  );
}

@riverpod
bool isCurrentUserFollowerSelector(Ref ref, String pubKey) {
  final identityKeyName = ref.watch(currentIdentityKeyNameSelectorProvider) ?? '';
  return ref.watch(
    userFollowersProvider(identityKeyName)
        .select((state) => state.valueOrNull?.contains(pubKey) ?? false),
  );
}
