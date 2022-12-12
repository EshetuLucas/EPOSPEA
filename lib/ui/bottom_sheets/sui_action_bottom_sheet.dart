import 'package:conference_app/app/app.locator.dart';
import 'package:conference_app/service/url_launcher_service.dart';
import 'package:conference_app/ui/bottom_sheets/sui_bottom_sheet_list_tile.dart';
import 'package:conference_app/ui/bottom_sheets/sui_frosted_bottom_sheet.dart';
import 'package:conference_app/ui/bottom_sheets/ui_models.dart';
import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:conference_app/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class EpospeaActionBottomSheetRequest {
  EpospeaActionBottomSheetRequest({
    required this.items,
    this.type = EpospeaBottomSheetListTileType.Simple,
    this.showTitle = true,
    this.showBackButton = false,
    this.separator,
    this.padding,
    this.height,
    this.minHeight,
    this.maxHeight,
    this.trailingChildren,
    this.showCustomWidgets = false,
  });

  final List<EpospeaActionBottomSheetItem> items;
  final EpospeaBottomSheetListTileType type;
  final EdgeInsets? padding;
  final bool showTitle;
  final bool showBackButton;
  final Widget? separator;
  final double? height;
  final double? minHeight;
  final double? maxHeight;
  final List<Widget>? trailingChildren;
  final bool showCustomWidgets;
}

class EpospeaActionBottomSheet extends StatelessWidget {
  EpospeaActionBottomSheet({
    Key? key,
    required this.request,
    this.completer,
    this.contentOnly = false,
  }) : super(key: key);

  final SheetRequest<EpospeaActionBottomSheetRequest> request;
  final Function(SheetResponse)? completer;
  final bool contentOnly;
  final _urlLauncherService = locator<UrlLauncherService>();

  int get itemCount => request.data!.items.length;

  bool get hasDescription =>
      request.description != null || request.description?.isNotEmpty == true;

  @override
  Widget build(BuildContext context) {
    final descriptionTextWidget = Text(
      request.description ?? '',
      style: ktsWhiteMediumTextStyle.copyWith(
        color: kcWhite.withOpacity(0.6),
      ),
    );

    final content = SingleChildScrollView(
      padding:
          request.data?.padding ?? const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          verticalSpaceSmall,
          if (request.data?.showTitle == true) ...[
            ...[
              Text(
                request.title ?? 'Options',
                style: ktsWhiteMediumTextStyle,
              ),
            ],
            verticalSpaceMedium,
            Text(
              request.description ?? '',
              style: ktsWhiteMediumTextStyle,
            ),
            verticalSpaceMedium,
            verticalSpaceSmall,
          ],
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    color: kcWhite,
                  ),
                  horizontalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (() =>
                            _urlLauncherService.makePhoneCall('+25116623545')),
                        child: Text(
                          '+25116623545',
                          style: ktsWhiteMediumTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      GestureDetector(
                        onTap: (() =>
                            _urlLauncherService.makePhoneCall('+251985202338')),
                        child: Text(
                          '+251985202338',
                          style: ktsWhiteMediumTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpaceSmall,
              Divider(
                color: kcWhite.withOpacity(0.6),
              ),
              verticalSpaceSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.message,
                    color: kcWhite,
                  ),
                  horizontalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (() =>
                            _urlLauncherService.sendSMS('+251985202338')),
                        child: Text(
                          '+251985202338',
                          style: ktsWhiteMediumTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpaceSmall,
              Divider(
                color: kcWhite.withOpacity(0.6),
              ),
              verticalSpaceSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.email,
                    color: kcWhite,
                  ),
                  horizontalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            _urlLauncherService.sendEmail('epospea@gmail.com'),
                        child: Text(
                          'epospea@gmail.com',
                          style: ktsWhiteMediumTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      GestureDetector(
                        onTap: () => _urlLauncherService
                            .sendEmail('epospeatayech@gmail.com'),
                        child: Text(
                          'epospeatayech@gmail.com',
                          style: ktsWhiteMediumTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpaceSmall,
              Divider(
                color: kcWhite.withOpacity(0.6),
              ),
              verticalSpaceSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.globe,
                    color: kcWhite,
                  ),
                  horizontalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _urlLauncherService
                            .openLink('https://www.epospeaeth.org'),
                        child: Text(
                          'www.epospeaeth.org',
                          style: ktsWhiteMediumTextStyle.copyWith(
                            color: kcSecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpaceLarge,
            ],
          ),
          if (request.data?.trailingChildren != null) ...[
            verticalSpaceMassive,
            Column(
              children: request.data?.trailingChildren ?? [],
            ),
          ],
        ],
      ),
    );

    if (contentOnly) return _container(content);

    return _container(
      EpospeaFrostedBottomSheet(
        blurValue: 4,
        child: content,
      ),
    );
  }

  Container _container(Widget content) {
    return Container(
      height: request.data?.height,
      constraints: BoxConstraints(
        minHeight: request.data?.minHeight ?? 300,
        maxHeight: request.data?.maxHeight ?? double.infinity,
      ),
      child: content,
    );
  }
}
