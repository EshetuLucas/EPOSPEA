import 'package:conference_app/app/app.locator.dart';
import 'package:conference_app/app/app.router.dart';
import 'package:conference_app/app/app_consts.dart';
import 'package:conference_app/service/url_launcher_service.dart';
import 'package:conference_app/ui/bottom_sheets/sui_action_bottom_sheet.dart';
import 'package:conference_app/ui/bottom_sheets/sui_bottom_sheet_list_tile.dart';
import 'package:conference_app/ui/bottom_sheets/ui_models.dart';
import 'package:conference_app/ui/setup_bottom_sheet_ui.dart';
import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerOptionsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _urlLauncherService = locator<UrlLauncherService>();

  bool _showUpMore = false;
  bool get showUpMore => _showUpMore;
  bool _showDownMore = false;
  bool get showDownMore => _showDownMore;

  GlobalKey<RectGetterState>? _lastItemKey;
  GlobalKey<RectGetterState>? get lastItemKey => _lastItemKey;

  GlobalKey<RectGetterState>? _firstItemKey;
  GlobalKey<RectGetterState>? get firstItemKey => _firstItemKey;

  set lasItemKey(GlobalKey<RectGetterState> value) {
    _lastItemKey = value;
  }

  set setFirstItemKey(GlobalKey<RectGetterState> value) {
    _firstItemKey = value;
  }

  List<Map<String, String>> get drawerOptions => [
        {
          'title': 'General Info',
          'url': general_info_url,
        },
        {
          'title': 'Registration',
          'url': registerationUrl,
        },
        {
          'title': 'Delegate List',
          'url': delegateListUrl,
        },
        {
          'title': 'Spearkers',
          'url': speakersUrl,
        },
        {
          'title': 'Event Schedule',
          'url': eventScheduleUrl,
        },
        {
          'title': 'Sponsorship package',
          'url': sponsorship_package,
        },
        {
          'title': 'Sponsorship Form',
          'url': sponsorship_form,
        },
        {
          'title': 'Hotels',
          'url': sponsorship_form,
        },
        {
          'title': 'Contact us',
          'url': sponsorship_form,
        },
      ];

  /// Navigate to register view
  void onOptionTap({required String url, required String title}) {
    if (title == 'Contact us') {
      print(lastItemKey != null);
      onContactUs();
      return;
    }
    if (title == 'Hotels') {
      _navigationService.navigateTo(Routes.hotelsView);
      return;
    }
    _navigationService.navigateTo(Routes.registerWebView,
        arguments: RegisterWebViewArguments(
          url: url,
          title: title,
        ));
  }

  void onContactUs() {
    _bottomSheetService
        .showCustomSheet<dynamic, EpospeaActionBottomSheetRequest>(
      title: 'Contact us',
      description:
          'Ethiopian Pulses Oilseeds and Spices processors exporters association',
      variant: BottomSheetType.Action,
      data: EpospeaActionBottomSheetRequest(
          type: EpospeaBottomSheetListTileType.Decorated,
          items: [],
          height: 800),
    );
  }

  set showUpMore(bool value) {
    _showUpMore = value;
    notifyListeners();
  }

  set showDownMore(bool value) {
    _showDownMore = value;
    notifyListeners();
  }
}
