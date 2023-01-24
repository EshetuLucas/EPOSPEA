import 'package:conference_app/app/app.locator.dart';
import 'package:conference_app/app/app.logger.dart';
import 'package:conference_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:in_app_update/in_app_update.dart';

class StartupViewModel extends BaseViewModel {
  final log = getLogger('StartupViewModel');
  final _navigationService = locator<NavigationService>();

  Future<void> runStartupLogic() async {
    await Future.delayed(Duration(seconds: 1));
    await _checkForUpdate();
  }

  Future<void> _checkForUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        final appUpdateResult = await InAppUpdate.startFlexibleUpdate();
        if (appUpdateResult == AppUpdateResult.success) {
          //App Update successful
          await InAppUpdate.completeFlexibleUpdate();
        }
      }
    } catch (e) {
      log.e('Unable to update the app: $e');
    } finally {
      _navigationService.clearStackAndShow(Routes.homeView);
    }
  }
}
