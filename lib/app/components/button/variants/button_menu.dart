part of '../button.dart';

class _ButtonMenu extends Button {
  _ButtonMenu({
    required super.onPressed,
    super.key,
    super.trailingIcon,
    super.leadingIcon,
    super.label,
    super.mainAxisSize,
    super.disabled,
    super.backgroundColor,
    super.borderColor,
    ButtonStyle style = const ButtonStyle(),
    bool active = false,
  }) : super(
          type: active ? ButtonType.menuActive : ButtonType.menuInactive,
          style: style.merge(
            OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(UiSize.small)),
              ),
              minimumSize: Size.square(40.0.s),
              padding: leadingIcon != null
                  ? EdgeInsets.only(
                      left: UiSize.xxxSmall,
                      right: active ? UiSize.small : 20.0.s,
                    )
                  : EdgeInsets.symmetric(horizontal: 14.0.s),
            ),
          ),
          leadingIconOffset: active ? UiSize.xSmall : 2.0.s,
        );
}
