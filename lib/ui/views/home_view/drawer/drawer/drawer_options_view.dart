import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:conference_app/ui/ui_helpers/ui_helpers.dart';
import 'package:conference_app/ui/views/home_view/drawer/drawer/drawer_options_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

const List<IconData> iconDatas = [
  CupertinoIcons.info_circle_fill,
  CupertinoIcons.create,
  CupertinoIcons.group_solid,
  CupertinoIcons.music_mic,
  Icons.calendar_month_sharp,
  Icons.handshake,
  CupertinoIcons.cube_box,
  CupertinoIcons.building_2_fill,
  CupertinoIcons.phone_circle,
];

class DrawerOptionsView extends StatelessWidget {
  const DrawerOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerOptionsViewModel>.reactive(
      onModelReady: (model) async {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          if (model.lastItemKey != null) {
            model.showDownMore = false;
          }
          if (model.firstItemKey != null) {
            model.showUpMore = false;
          }
        });
      },
      viewModelBuilder: () => DrawerOptionsViewModel(),
      builder: (
        BuildContext context,
        DrawerOptionsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: kcPrimaryColor,
          body: SafeArea(
            child: Column(
              children: [
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => ZoomDrawer.of(context)!.toggle(),
                        icon: Icon(
                          CupertinoIcons.back,
                          color: kcWhite,
                        ),
                      ),
                      Text(
                        'Menu',
                        style: ktsWhiteMediumTextStyle.copyWith(fontSize: 18),
                      ),
                      horizontalSpaceSmall
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: model.drawerOptions.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: kcWhite,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          var globalKey = RectGetter.createGlobalKey();
                          final option = model.drawerOptions[index];
                          String title = option['title']!;
                          String url = option['url']!;
                          if (index == model.drawerOptions.length - 1) {
                            model.lasItemKey = globalKey;
                          }
                          if (index == 0) {
                            model.setFirstItemKey = globalKey;
                          }
                          return RectGetter(
                            key: globalKey,
                            child: VisibilityDetector(
                              key: Key(index.toString()),
                              onVisibilityChanged: (info) {
                                if (index == model.drawerOptions.length - 1) {
                                  if (info.visibleFraction * 100 < 50) {
                                    model.showDownMore = true;
                                  } else {
                                    model.showDownMore = false;
                                  }
                                } else if (index == 0) {
                                  print(info.visibleFraction * 100);
                                  if (info.visibleFraction * 100 < 10) {
                                    print('not visibile');
                                    model.showUpMore = true;
                                  } else {
                                    model.showUpMore = false;
                                  }
                                }
                              },
                              child: ListTile(
                                leading: Icon(
                                  iconDatas[index],
                                  color: kcWhite,
                                ),
                                title: Text(
                                  title,
                                  style: ktsWhiteMediumTextStyle.copyWith(
                                      fontSize: 14),
                                ),
                                onTap: () =>
                                    model.onOptionTap(url: url, title: title),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 1,
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                            duration: Duration(
                              seconds: 1,
                            ),
                            child: model.firstItemKey == null ||
                                    (RectGetter.getRectFromKey(
                                                    model.firstItemKey!) !=
                                                null &&
                                            RectGetter.getRectFromKey(
                                                        model.firstItemKey!)!
                                                    .top <
                                                80 ||
                                        model.showUpMore)
                                ? Icon(
                                    CupertinoIcons.sort_up,
                                    color: kcWhite,
                                  )
                                : verticalSpaceSmall,
                          ),
                          Spacer(),
                          AnimatedSwitcher(
                            duration: Duration(
                              seconds: 1,
                            ),
                            child: model.lastItemKey == null ||
                                    (RectGetter.getRectFromKey(
                                                model.lastItemKey!) !=
                                            null &&
                                        RectGetter.getRectFromKey(
                                                    model.lastItemKey!)!
                                                .bottom <
                                            80) ||
                                    model.showDownMore
                                ? Icon(
                                    CupertinoIcons.sort_down,
                                    color: kcWhite,
                                  )
                                : verticalSpaceSmall,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
                verticalSpaceMedium,
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                    ),
                    child: Text(
                        '@2022 - All Rights Reserved. Design and developed by Royd Techs IT and Communication',
                        style: ktsWhiteSmallTextStyle.copyWith(fontSize: 11)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
