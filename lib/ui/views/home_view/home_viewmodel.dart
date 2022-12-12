import 'package:conference_app/app/app.locator.dart';
import 'package:conference_app/app/app.logger.dart';
import 'package:conference_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _navigationService = locator<NavigationService>();

  /// Navigate to register view
  void onRegister({required String url, required String title}) {
    _navigationService.navigateTo(Routes.registerWebView,
        arguments: RegisterWebViewArguments(url: url, title: title));
  }

  Future<void> launchMapsUrl() async {
    final _url =
        'https://www.google.com/maps/dir/?api=1&travelmode=driving&destination=Sheraton+Addis,+a+Luxury+Collection+Hotel,+Addis+Ababa';
    if (!await launch(_url)) throw 'Could not launch';
  }

  String checker(String value) {
    var cases = ['[]', '()', '{}'];
    var openBrackets = [];
    var chars = value.split('');
    var result = "Vaild";
    if (value.split('').length % 2 != 0) {
      result = "Invalid";
      log.d(result);
      return result;
    }
    for (var i = 0; i < chars.length; i++) {
      var char = value.split('')[i];
      log.v('char:$char');
      if (i != chars.length - 1) {
        var match = char + chars[i + 1];
        log.d('match:$match');
        if (cases.contains(match)) {
          i++;
          continue;
        }
      }

      if (['{', '(', '['].contains(char)) {
        openBrackets.add(char);
      } else {
        var match = openBrackets[openBrackets.length - 1] + char;
        if (cases.contains(match)) {
          continue;
        } else {
          result = "Invalid";
          break;
        }
      }
    }
    return result;
    // This code will be removed from this file when we release the app
    // Only for test cases.
  }
}
