import 'package:conference_app/app/app.locator.dart';
import 'package:conference_app/service/url_launcher_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _urlLauncherService = locator<UrlLauncherService>();

  List<Map<String, String>> get suggestedHotels => [
        {
          'title': 'Skylight hotel',
          'imageUrl': 'assets/images/sky1.png',
          'contactPersonEmail': 'hilinaB@ethiopianairlines.com',
          'location': 'Ethiopian+Skylight+Hotel',
        },
        {
          'title': 'Radisson blu Hotel',
          'imageUrl': 'assets/images/rad1.jpg',
          'contactPersonEmail': 'samrawit.molla@radissonblu.com',
          'location': 'Radisson+Blu+Hotel,+Addis+Ababa',
        },
        {
          'title': 'Inter luxury hotel',
          'imageUrl': 'assets/images/inter13.jpeg',
          'contactPersonEmail': 'jacqueline.solomon@interluxuryhotel.com',
          'location':
              'Inter+Luxury+Hotel+%7C+Kazanchis+%7C+ኢንተር+ሌግዠሪ+ሆቴል+%7C+ካዛንቺስ',
        },
        {
          'title': 'Hilton hotel',
          'imageUrl': 'assets/images/hilton1.jpeg',
          'contactPersonEmail': 'mekdes.Assefa@hilton.com',
          'location': 'Hilton+Addis+Ababa',
        },
        {
          'title': 'Capital Hotel',
          'imageUrl': 'assets/images/cap1.png',
          'contactPersonEmail': 'info@capitalhotelandspa.com',
          'location': 'Capital+Hotel+and+Spa',
        },
      ];

  Future<void> launchMapsUrl(String location) async {
    if (!await launch(
        'https://www.google.com/maps/dir/?api=1&travelmode=driving&destination=$location'))
      throw 'Could not launch';
  }

  Future<void> sendEmail(String contactEmail) async {
    await _urlLauncherService.sendEmail(contactEmail);
  }
}
