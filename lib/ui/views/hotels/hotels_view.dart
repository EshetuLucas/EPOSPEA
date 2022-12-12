import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:conference_app/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'hotels_viewmodel.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HotelsViewModel>.reactive(
      viewModelBuilder: () => HotelsViewModel(),
      builder: (
        BuildContext context,
        HotelsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/she1.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 2,
                  top: 50,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Card(
                      color: kcPrimaryColor,
                      clipBehavior: Clip.antiAlias,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            CupertinoIcons.back,
                            color: kcWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width - 50,
                  top: 210,
                  child: GestureDetector(
                    onTap: () => model.launchMapsUrl(
                        'Sheraton+Addis,+a+Luxury+Collection+Hotel,+Addis+Ababa'),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Card(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(00),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(.0),
                          child: Image.asset(
                            'assets/images/nav11.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sherton Addis Hotel',
                    style: ktsBoldTextStyle.copyWith(
                        color: kcPrimaryColor, fontSize: 17),
                  ),
                  Text(
                    'The Conference Venue is at Sherton Addis Hotel',
                    style: ktsSmallDarkTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Text(
                          'Email: - ',
                          style: ktsSmallDarkTextStyle.copyWith(fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () => model.sendEmail(
                              'bitania.Mulugeta@luxurycollection.com'),
                          child: Text(
                            'bitania.Mulugeta@luxurycollection.com',
                            style: ktsSmallDarkTextStyle.copyWith(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpaceMedium,
                  Text(
                    'Suggested Hotels',
                    style: ktsBoldTextStyle.copyWith(
                        color: kcPrimaryColor, fontSize: 17),
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 40),
                  shrinkWrap: true,
                  itemCount: model.suggestedHotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    final suggestedHotel = model.suggestedHotels[index];
                    return Container(
                      height: 165,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 23),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      suggestedHotel['imageUrl']!,
                                      fit: BoxFit.cover,
                                      width: 160,
                                    ),
                                    Expanded(
                                      child: ColoredBox(
                                        color: kcPrimaryColor.withOpacity(0.9),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            verticalSpaceSmall,
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                suggestedHotel['title']!,
                                                style: ktsWhiteMediumTextStyle
                                                    .copyWith(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: SizedBox(
                                                height: 20,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Email:',
                                                      style:
                                                          ktsSmallDarkTextStyle
                                                              .copyWith(
                                                        fontSize: 14,
                                                        color: kcWhite,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 2),
                                              child: GestureDetector(
                                                onTap: () => model.sendEmail(
                                                    suggestedHotel[
                                                        'contactPersonEmail']!),
                                                child: Text(
                                                  suggestedHotel[
                                                      'contactPersonEmail']!,
                                                  style: ktsSmallDarkTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
                                                    color: kcSecondaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () => model
                                    .launchMapsUrl(suggestedHotel['location']!),
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Card(
                                    color: Colors.transparent,
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(00),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(.0),
                                      child: Image.asset(
                                        'assets/images/nav11.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
