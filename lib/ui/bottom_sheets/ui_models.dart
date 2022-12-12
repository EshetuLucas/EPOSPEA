import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ui_models.freezed.dart';

@freezed
class EpospeaActionBottomSheetItem with _$EpospeaActionBottomSheetItem {
  const EpospeaActionBottomSheetItem._();
  factory EpospeaActionBottomSheetItem({
    required String title,
    String? subtitle,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    Icon? icon,
    Icon? trailingIcon,
    Widget? trailing,
    Widget? leading,
    Widget? titleWidget,
    IconData? leadingIconData,
    IconData? trailingIconData,
    double? trailingIconSize,
    Color? trailingIconColor,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    String? disabledText,
    @Default(false) bool disabled,

    /// Indicates if this item will be used for navigation
    /// to set the logic and apply the animation for [FadingWidget]
    @Default(false) bool navigation,
  }) = _EpospeaActionBottomSheetItem;

  bool get hasLeadingIconData => leadingIconData != null;
}
