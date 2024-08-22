part of 'app_routes.dart';

class ProtectAccountRoutes {
  static const routes = <TypedRoute<RouteData>>[
    TypedGoRoute<SecureAccountModalRoute>(path: '/secure-account-modal'),
    TypedGoRoute<SecureAccountOptionsRoute>(path: '/secure-account-options'),
    TypedGoRoute<SecureAccountErrorRoute>(path: '/secure-account-error'),
    TypedGoRoute<BackupOptionsRoute>(path: '/backup-options'),
    TypedGoRoute<BackupRecoveryKeysRoute>(path: '/backup-recovery-keys'),
    TypedGoRoute<RecoveryKeysSaveRoute>(path: '/recovery-keys-save'),
    TypedGoRoute<RecoveryKeysInputRoute>(path: '/recovery-keys-input'),
    TypedGoRoute<RecoveryKeysSuccessRoute>(path: '/recovery-keys-success'),
    TypedGoRoute<ScreenshotSecurityAlertRoute>(path: '/screenshot-security-alert'),
    TypedGoRoute<RecoveryKeysErrorAlertRoute>(path: '/recovery-keys-error-alert'),
    TypedGoRoute<AuthenticatorSetupRoute>(path: '/authenticator-setup/:step'),
  ];
}

class SecureAccountModalRoute extends BaseRouteData {
  SecureAccountModalRoute()
      : super(
          child: const SecureAccountModal(),
          type: IceRouteType.bottomSheet,
        );
}

class SecureAccountOptionsRoute extends BaseRouteData {
  SecureAccountOptionsRoute()
      : super(
          child: const SecureAccountOptionsPage(),
          type: IceRouteType.bottomSheet,
        );
}

class SecureAccountErrorRoute extends BaseRouteData {
  SecureAccountErrorRoute()
      : super(
          child: const SecureAccountErrorAlert(),
          type: IceRouteType.bottomSheet,
        );
}

class BackupOptionsRoute extends BaseRouteData {
  BackupOptionsRoute()
      : super(
          child: const BackupOptionsPage(),
          type: IceRouteType.bottomSheet,
        );
}

class BackupRecoveryKeysRoute extends BaseRouteData {
  BackupRecoveryKeysRoute()
      : super(
          child: const BackupRecoveryKeysModal(),
          type: IceRouteType.bottomSheet,
        );
}

class RecoveryKeysSaveRoute extends BaseRouteData {
  RecoveryKeysSaveRoute()
      : super(
          child: const RecoveryKeysSavePage(),
          type: IceRouteType.bottomSheet,
        );
}

class RecoveryKeysInputRoute extends BaseRouteData {
  RecoveryKeysInputRoute()
      : super(
          child: const RecoveryKeysInputPage(),
          type: IceRouteType.bottomSheet,
        );
}

class RecoveryKeysSuccessRoute extends BaseRouteData {
  RecoveryKeysSuccessRoute()
      : super(
          child: const RecoveryKeysSuccessPage(),
          type: IceRouteType.bottomSheet,
        );
}

class ScreenshotSecurityAlertRoute extends BaseRouteData {
  ScreenshotSecurityAlertRoute()
      : super(
          child: const ScreenshotSecurityAlert(),
          type: IceRouteType.bottomSheet,
        );
}

class RecoveryKeysErrorAlertRoute extends BaseRouteData {
  RecoveryKeysErrorAlertRoute()
      : super(
          child: const RecoveryKeysErrorAlert(),
          type: IceRouteType.bottomSheet,
        );
}

class AuthenticatorSetupRoute extends BaseRouteData {
  AuthenticatorSetupRoute({required this.step})
      : super(
          child: AuthenticatorSetupPage(step),
          type: IceRouteType.bottomSheet,
        );

  final AuthenticatorSteps step;
}
