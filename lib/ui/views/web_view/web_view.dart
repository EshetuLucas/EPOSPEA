import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'web_viewer.dart';
import 'web_viewmodel.dart';

class RegisterWebView extends StatefulWidget {
  final String url;
  final String title;

  const RegisterWebView({
    super.key,
    required this.url,
    required this.title,
  });
  @override
  RegisterWebViewState createState() => RegisterWebViewState();
}

class RegisterWebViewState extends State<RegisterWebView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterWebViewModel>.reactive(
      viewModelBuilder: () => RegisterWebViewModel(),
      onModelReady: (model) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
        model.initialise(widget.url);
      },
      builder: (context, model, child) => WebViewer(
        title: widget.title,
        initialUrl: model.initialUrl,
        isBusy: model.isBusy,
        isWebViewLoading: model.isWebViewLoading,
        hasError: model.hasError,
        loadingText: 'Loading..',
        errorText: 'Something went wrong. Try again!',
        onRefresh: () => model.initialise(widget.url),
        onPageStarted: (_) => model.setWebViewLoading(true),
        onPageFinished: (_) {
          model.setWebViewLoading(false);
        },
      ),
    );
  }
}
