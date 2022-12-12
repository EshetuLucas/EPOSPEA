import 'package:conference_app/ui/setup_bottom_sheet_ui.dart';
import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:conference_app/ui/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'ui/views/home_view/drawer/zoom_drawer_view.dart';

void main() {
  setupLocator();
  setupBottomSheetUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kcWhite,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: kcDarkGreyColor,
          ),
        ),
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: kcWhite,
            systemNavigationBarDividerColor: kcWhite,
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Stack(
          children: [
            ZoomDrawerView(),
            // IgnorePointer(
            //   ignoring: true,
            //   child: Container(
            //     height: double.infinity,
            //     width: double.infinity,
            //     color: Colors.black12,
            //     child: Container(
            //         color: Colors.black.withOpacity(0.25),
            //         child: RotationTransition(
            //           turns: new AlwaysStoppedAnimation(-45 / 360),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Stack(
            //                 children: [
            //                   Image.asset(
            //                     'assets/images/rologo.png',
            //                     fit: BoxFit.contain,
            //                   ),
            //                   Positioned(
            //                     top: 120,
            //                     left: 50,
            //                     child: Material(
            //                       color: Colors.white.withOpacity(0.6),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: Text(
            //                           'This is demo version.\nThe watermark will be removed on production',
            //                           style: ktsDarkGreyBoldTextStyle.copyWith(
            //                               color: kcDeepBlue, fontSize: 15),
            //                         ),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ],
            //           ),
            //         )),
            //   ),
            // )
          ],
        ),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
