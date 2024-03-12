import 'package:flutter/material.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/shadow_text/shadow_text.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/dapps/views/pages/mocks/mocked_apps.dart';
import 'package:ice/app/router/app_routes.dart';

class FeaturedCollection extends StatelessWidget {
  const FeaturedCollection({super.key, required this.items});

  final List<DAppItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0.s,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: ScreenSideOffset.defaultSmallMargin),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSideOffset.defaultSmallMargin,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final String assetBg = items[index].backgroundImage ?? '';
          return GestureDetector(
            onTap: () => IceRoutes.dappsDetails.go(context),
            child: Container(
              width: 240.0.s,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0.s),
                image: DecorationImage(
                  image: AssetImage(
                    assetBg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 14.0.s,
                    left: 14.0.s,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0.s),
                          ),
                          child: Image.asset(
                            items[index].iconImage,
                            width: 30.0.s,
                          ),
                        ),
                        SizedBox(width: 8.0.s),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ShadowText(
                              child: Text(
                                items[index].title,
                                style:
                                    context.theme.appTextThemes.body.copyWith(
                                  color: context
                                      .theme.appColors.secondaryBackground,
                                ),
                              ),
                            ),
                            ShadowText(
                              child: Text(
                                items[index].description ?? '',
                                style: context.theme.appTextThemes.caption3
                                    .copyWith(
                                  color: context
                                      .theme.appColors.secondaryBackground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}