import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:flutter/material.dart';

import 'ui_models.dart';

enum EpospeaBottomSheetListTileType {
  Simple,
  Decorated,
}

class EpospeaBottomSheetListTile extends StatelessWidget {
  const EpospeaBottomSheetListTile({
    Key? key,
    required this.item,
    this.type = EpospeaBottomSheetListTileType.Simple,
    this.onTap,
    this.onLongPress,
    this.onTapTrailingButton,
  }) : super(key: key);

  final EpospeaBottomSheetListTileType type;
  final EpospeaActionBottomSheetItem item;
  final Function()? onTap;
  final Function()? onTapTrailingButton;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final listTile = ListTile(
      enabled: !item.disabled,
      leading: item.leading ??
          (item.hasLeadingIconData
              ? CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      type == EpospeaBottomSheetListTileType.Decorated
                          ? kcAppBackgroundColor
                          : kcWhite,
                  child: Icon(
                    item.leadingIconData,
                    color: type == EpospeaBottomSheetListTileType.Decorated
                        ? kcWhite
                        : kcWhite,
                  ),
                )
              : null),
      title: item.titleWidget ??
          Text(
            item.title,
            style: item.titleTextStyle ?? ktsWhiteMediumTextStyle,
          ),
      subtitle: item.subtitle != null
          ? Text(
              item.subtitle!,
              style: item.subtitleTextStyle ??
                  ktsBoldMeidumDarkTextStyle.copyWith(
                    fontSize: 12,
                    color: kcWhite.withOpacity(0.6),
                  ),
            )
          : null,
      trailing: item.titleWidget == null
          ? GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: item.trailingIcon ??
                    Icon(
                      item.trailingIconData ?? Icons.chevron_right_rounded,
                      size: item.trailingIconSize ?? 24,
                      color: item.trailingIconColor ?? kcWhite,
                    ),
              ),
              onTap: onTapTrailingButton ?? item.onTap,
            )
          : item.trailing,
      onTap: onTap ?? item.onTap,
      onLongPress: onLongPress ?? item.onLongPress,
      contentPadding: const EdgeInsets.all(0),
    );

    switch (type) {
      case EpospeaBottomSheetListTileType.Simple:
        return listTile;

      case EpospeaBottomSheetListTileType.Decorated:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          decoration: BoxDecoration(
            color: kcPrimaryColor,
          ),
          child: listTile,
        );

      default:
        return listTile;
    }
  }
}
