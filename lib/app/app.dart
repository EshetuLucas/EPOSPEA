import 'package:conference_app/service/url_launcher_service.dart';
import 'package:conference_app/ui/views/contact_us/contact_us_view.dart';
import 'package:conference_app/ui/views/home_view/home_view.dart';
import 'package:conference_app/ui/views/hotels/hotels_view.dart';
import 'package:conference_app/ui/views/web_view/web_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: RegisterWebView),
    CupertinoRoute(page: ContactUsView),
    CupertinoRoute(page: HotelsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: UrlLauncherService),
  ],
  logger: StackedLogger(),
)
class AppSetUp {}
