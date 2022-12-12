import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import 'bottom_sheets/sui_action_bottom_sheet.dart';

enum BottomSheetType {
  Basic,
  Action,
}

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();
  final builders = {
    BottomSheetType.Action: (context, sheetRequest, completer) =>
        EpospeaActionBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
