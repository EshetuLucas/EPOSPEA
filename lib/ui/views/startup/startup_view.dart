import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      onModelReady: (model) => SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) async {
          await model.runStartupLogic();
        },
      ),
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcPrimaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: kcWhite,
            strokeWidth: 10,
          ),
        ),
      ),
    );
  }
}
