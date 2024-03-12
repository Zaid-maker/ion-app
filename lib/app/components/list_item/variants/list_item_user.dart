part of '../list_item.dart';

class _ListItemUser extends ListItem {
  _ListItemUser({
    super.key,
    super.border,
    super.trailingPadding,
    super.backgroundColor,
    super.onTap,
    super.trailing,
    Widget? leading,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? leadingPadding,
    BoxConstraints? constraints,
    required Widget title,
    required Widget subtitle,
    String? profilePicture,
    bool verifiedBadge = false,
    bool iceBadge = false,
    DateTime? timeago,
  }) : super(
          leading: leading ??
              (profilePicture != null
                  ? Avatar(
                      size: avatarSize,
                      imageUrl: profilePicture,
                    )
                  : null),
          borderRadius: borderRadius ?? BorderRadius.zero,
          contentPadding: contentPadding ?? EdgeInsets.zero,
          leadingPadding: leadingPadding ?? EdgeInsets.only(right: 8.0.s),
          constraints: constraints ?? const BoxConstraints(),
          title: Row(
            children: <Widget>[
              title,
              if (iceBadge)
                Padding(
                  padding: EdgeInsets.only(left: 4.0.s),
                  child: Assets.images.icons.iconBadgeIcelogo
                      .image(width: badgeSize, height: badgeSize),
                ),
              if (verifiedBadge)
                Padding(
                  padding: EdgeInsets.only(left: 4.0.s),
                  child: Assets.images.icons.iconBadgeVerify
                      .image(width: badgeSize, height: badgeSize),
                ),
            ],
          ),
          subtitle: Row(
            children: <Widget>[
              subtitle,
              if (timeago != null) _TimeAgo(date: timeago),
            ],
          ),
        );

  static double get avatarSize => 30.0.s;

  static double get badgeSize => 16.0.s;

  @override
  Color _getBackgroundColor(BuildContext context) {
    return backgroundColor ?? Colors.transparent;
  }

  @override
  TextStyle _getDefaultTitleStyle(BuildContext context) {
    return context.theme.appTextThemes.subtitle3.copyWith(
      color: context.theme.appColors.primaryText,
    );
  }

  @override
  TextStyle _getDefaultSubtitleStyle(BuildContext context) {
    return context.theme.appTextThemes.caption.copyWith(
      color: context.theme.appColors.tertararyText,
    );
  }
}

class _TimeAgo extends StatelessWidget {
  const _TimeAgo({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Timeago(
      date: date,
      builder: (BuildContext context, String value) => Text(' • $value'),
      locale: 'en_short',
    );
  }
}