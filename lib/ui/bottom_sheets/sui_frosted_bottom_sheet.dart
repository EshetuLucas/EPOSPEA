import 'dart:ui';

import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';

class EpospeaFrostedBottomSheet extends StatelessWidget {
  final Widget? child;
  final double blurValue;
  final bool hasDraggableIndicator;
  final BorderRadius borderRadius;
  final Color? backgroundColor;

  const EpospeaFrostedBottomSheet({
    Key? key,
    this.child,
    this.hasDraggableIndicator = true,
    this.blurValue = 190,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor ?? kcPrimaryColor.withOpacity(0.5),
        borderRadius: borderRadius,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurValue,
          sigmaY: blurValue,
        ),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasDraggableIndicator)
                Center(
                  child: _DraggableBottomSheetIndicator(),
                ),
              if (child != null) Expanded(child: child!),
            ],
          ),
        ),
      ),
    );
  }
}

class _DraggableBottomSheetIndicator extends StatelessWidget {
  const _DraggableBottomSheetIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 4,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Colors.black38,
          width: 0.5,
        ),
      ),
    );
  }
}
