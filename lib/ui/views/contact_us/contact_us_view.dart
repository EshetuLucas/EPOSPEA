import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'contact_us_viewmodel.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
      viewModelBuilder: () => ContactUsViewModel(),
      builder: (
        BuildContext context,
        ContactUsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'ContactUsView',
            ),
          ),
        );
      },
    );
  }
}
