import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/extensions/extensions.dart';
import 'package:ice/app/features/auth/data/models/auth_state.dart';
import 'package:ice/app/features/auth/providers/auth_provider.dart';
import 'package:ice/generated/assets.gen.dart';

class SignUpPasswordButton extends HookConsumerWidget {
  const SignUpPasswordButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Button(
      disabled: authState is AuthenticationLoading,
      trailingIcon: authState is AuthenticationLoading
          ? const ButtonLoadingIndicator()
          : Assets.images.icons.iconButtonNext.icon(
              color: context.theme.appColors.onPrimaryAccent,
            ),
      onPressed: onPressed,
      label: Text(context.i18n.button_continue),
      mainAxisSize: MainAxisSize.max,
    );
  }
}
