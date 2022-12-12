import 'package:conference_app/app/app_consts.dart';
import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:conference_app/ui/ui_helpers/ui_helpers.dart';
import 'package:conference_app/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (() => ZoomDrawer.of(context)!.toggle()),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 22,
                      color: kcPrimaryColor,
                    ),
                    Material(
                      child: Text(
                        'Menu',
                        style: ktsSmallDarkTextStyle.copyWith(
                            color: kcPrimaryColor, fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ),
            title: Text(
              'EPOSPEA',
              style: ktsBoldTextStyle.copyWith(
                  fontSize: 23, color: kcPrimaryColor, height: 1.1),
            ),
            elevation: 0,
            backgroundColor: kcWhite,
          ),
          backgroundColor: kcLightGrey2,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: kcPrimaryColor,
            onPressed: () =>
                model.onRegister(url: registerationUrl, title: 'Register'),
            isExtended: true,
            label: const Text('Register Now'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: appSymmetricEdgePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    SizedBox(
                      height: 220,
                      child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              horizontalSpaceSmall,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '15-16',
                                    style: ktsBoldTextStyle.copyWith(
                                        fontSize: 33,
                                        color: kcPrimaryColor,
                                        height: 1.1),
                                  ),
                                  Text(
                                    'Nov',
                                    style: ktsLightGreySmallTextStyle.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '2022',
                                    style: ktsDarkSmallTextStyle.copyWith(
                                        fontSize: 21),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    'Sheraton Addis Hotel,\nAddis Ababa,\n Ethiopia',
                                    style: ktsDarkSmallTextStyle.copyWith(
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                              horizontalSpaceSmall,
                              const VerticalDivider(
                                color: kcDarkGreyColor,
                                width: 1,
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/images/event_image.png',
                                ),
                              ),
                            ],
                          )),
                    ),
                    verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Location',
                        style: ktsBoldMeidumDarkTextStyle.copyWith(
                            color: kcPrimaryColor),
                      ),
                    ),
                    SizedBox(
                        height: 223,
                        width: double.infinity,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/sheraton.png',
                                fit: BoxFit.fitWidth,
                              ),
                              AppButton(
                                title: 'Navigate',
                                onTap: model.launchMapsUrl,
                                height: 40,
                              ),
                            ],
                          ),
                        )),
                    verticalSpaceMedium,
                    Divider(
                      color: kcPrimaryColor,
                    ),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Dear Sir/Madam\n',
                        style: ktsBoldMeidumDarkTextStyle.copyWith(
                            color: kcPrimaryColor),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text(
                        'We are pleased to announce the official dates for 11th International Conference on Pulses and Oil seeds that will take place on November 15th and 16th, 2022 at Sheraton Addis Hotel, Addis Ababa, Ethiopia. 15 highly experienced business men and experts in the industry will make speech on the current global trade patterns of the sector.   It is the largest event in Eastern and Sub Saharan Africa where you could meet:- \n\n'
                        '👉 International Buyers from all over the World.\n'
                        '👉 International Importer Associations.\n'
                        '👉 Value Chain companies and service providers.\n'
                        '👉 Agro-processing industries and grain producers’ traders.\n'
                        '👉 Importers & Exporters\n'
                        '👉 Participants of over 350 of Ethiopian Pulses, oil seeds and spices processors exporters Association members.\n'
                        '👉 Fertilizer suppliers, Machine suppliers and Agro-chemical suppliers.\n\n'
                        'So we cordially invite you to be part of this International Conference. Furthermore, participants will get exclusive oil seeds and pulses Market Information, fabulous networking opportunities at our annual convention. Ethiopia is a huge player in the global pulses and oil seeds market. It will be a fantastic opportunity to make connections and gain great insights',
                        style: ktsSmallDarkTextStyle,
                      ),
                    ),
                    verticalSpaceSmall,
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () => model.onRegister(
                              url: delegateListUrl, title: 'Delegate List'),
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: kcWhite,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Check Delegate List ',
                                style: ktsBoldMeidumDarkTextStyle.copyWith(
                                    color: kcPrimaryColor),
                              ),
                            ),
                          ),
                        )),
                    verticalSpaceMassive
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
