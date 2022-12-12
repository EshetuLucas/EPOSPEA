import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/views/home_view/drawer/drawer/drawer_options_view.dart';
import 'package:conference_app/ui/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuScreen: Container(
        color: kcPrimaryColor,
        child: DrawerOptionsView(),
      ),
      mainScreen: const HomeView(),
      mainScreenScale: 0.13,
      borderRadius: 24,
      showShadow: false,
      mainScreenAbsorbPointer: false,
      menuScreenTapClose: true,
      angle: 0,
      slideWidth: MediaQuery.of(context).size.width * .60,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
      menuBackgroundColor: kcPrimaryColor,
    );
  }
}
