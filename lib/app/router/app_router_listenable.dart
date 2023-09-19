import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ice/app/features/auth/data/models/auth_state.dart';
import 'package:ice/app/features/auth/providers/auth_provider.dart';
import 'package:ice/app/features/core/providers/init_provider.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_listenable.g.dart';

/// Inspired by https://github.com/lucavenir/go_router_riverpod

@riverpod
class AppRouterListenable extends _$AppRouterListenable implements Listenable {
  VoidCallback? _routerListener;
  AuthState _authState = const AuthenticationUnknown();
  AsyncValue<void>? _init;

  @override
  Future<void> build() async {
    _authState = ref.watch(authProvider);
    _init = ref.watch(initAppProvider);

    ref.listenSelf((_, __) {
      if (state.isLoading) {
        return;
      }
      _routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final bool isAuthInProgress =
        state.matchedLocation == const AuthRoute().location;
    final bool isSplash = state.matchedLocation == const SplashRoute().location;
    final bool isInitError = _init?.hasError ?? false;
    final bool isInitInProgress = _init?.isLoading ?? true;

    if (isInitError) {
      return const ErrorRoute().location;
    }

    if (isInitInProgress && !isSplash) {
      return const SplashRoute().location;
    }

    if (isSplash && !isInitInProgress) {
      if (_authState is Authenticated) {
        return const WalletRoute().location;
      }
      if (_authState is UnAuthenticated) {
        return const AuthRoute().location;
      }
    }

    if (isAuthInProgress && _authState is Authenticated) {
      return const WalletRoute().location;
    }

    if (!isAuthInProgress && _authState is UnAuthenticated) {
      return const AuthRoute().location;
    }

    return null;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
