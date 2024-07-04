import 'package:flutter/material.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/features/auth/views/pages/discover_creators/mocked_creators.dart';
import 'package:ice/app/features/feed/views/components/article/article.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'article',
  type: Article,
)
Widget feedPostUseCase(BuildContext context) {
  return Scaffold(
    body: ScreenSideOffset.small(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Article(
            id: 'test_article_id',
            title: context.knobs.string(
              label: 'Title',
              initialValue:
                  'The volume of the BNB Chain network increased in May 65%',
            ),
            publishedAt: context.knobs.dateTime(
              label: 'Published at',
              initialValue: DateTime(2024, 2, 27, 11),
              start: DateTime(1970, 1, 1, 1),
              end: DateTime.now(),
            ),
            imageUrl:
                'https://ice.io/wp-content/uploads/2023/03/Pre-Release-600x403.png',
            minutesToRead: context.knobs.int.input(
              label: 'Minutes to read',
              initialValue: 7,
            ),
            user: User(
              name: context.knobs.string(
                label: 'Name',
                initialValue: 'Alina Proxima',
              ),
              nickname: context.knobs.string(
                label: 'Username',
                initialValue: 'alinaproxima',
              ),
              imageUrl:
                  'https://ice-staging.b-cdn.net/profile/default-profile-picture-16.png',
              isVerified: true,
            ),
          ),
        ],
      ),
    ),
  );
}