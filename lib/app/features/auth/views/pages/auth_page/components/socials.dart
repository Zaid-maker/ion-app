import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/features/auth/data/models/social_auth_type.dart';
import 'package:ice/app/features/auth/views/pages/auth_page/components/social_button.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/generated/assets.gen.dart';

class Socials extends HookConsumerWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSecondRowVisible = useState(false);

    Null Function() onPressHandler(SocialAuthType type) {
      return switch (type) {
        SocialAuthType.apple => () {
            CheckEmailRoute().push<void>(context);
          },
        SocialAuthType.nostr => () {
            NostrAuthRoute().push<void>(context);
          },
        SocialAuthType.x => () {
            FillProfileRoute().push<void>(context);
          },
        SocialAuthType.fb => () {
            EnterCodeRoute().push<void>(context);
          },
        SocialAuthType.github => () {
            SelectLanguagesRoute().push<void>(context);
          },
        SocialAuthType.discord => () {
            DiscoverCreatorsRoute().push<void>(context);
          },
        SocialAuthType.linkedin => () {
            DiscoverCreatorsRoute().push<void>(context);
          },
      };
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 110.0.s,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...<SocialAuthType>[
                SocialAuthType.apple,
                SocialAuthType.nostr,
                SocialAuthType.x,
              ].map(
                (SocialAuthType type) => SocialButton(
                  icon: type.buttonIcon,
                  onPressed: onPressHandler(type),
                ),
              ),
              SocialButton(
                icon: isSecondRowVisible.value
                    ? Assets.images.icons.iconLoginDropup.icon()
                    : Assets.images.icons.iconLoginDropdown.icon(),
                onPressed: () {
                  isSecondRowVisible.value = !isSecondRowVisible.value;
                },
              ),
            ],
          ),
          if (isSecondRowVisible.value)
            Padding(
              padding: EdgeInsets.only(top: 16.0.s),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <SocialAuthType>[
                  SocialAuthType.fb,
                  SocialAuthType.github,
                  SocialAuthType.discord,
                  SocialAuthType.linkedin,
                ]
                    .map(
                      (SocialAuthType type) => SocialButton(
                        icon: type.buttonIcon,
                        onPressed: onPressHandler(type),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
