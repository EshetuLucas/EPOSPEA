import 'package:conference_app/ui/ui_helpers/app_colors.dart';
import 'package:conference_app/ui/ui_helpers/shared_styles.dart';
import 'package:conference_app/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewer extends StatelessWidget {
  final String title;
  final String? initialUrl;
  final bool isBusy;
  final bool isWebViewLoading;
  final bool hasError;
  final String? loadingText;
  final String? errorText;
  final Function()? onRefresh;
  final Function(String)? onPageStarted;
  final Function(String)? onPageFinished;
  final NavigationDelegate? navigationDelegate;

  const WebViewer({
    Key? key,
    required this.title,
    this.initialUrl,
    required this.isBusy,
    this.isWebViewLoading = false,
    this.hasError = false,
    this.loadingText,
    this.errorText,
    this.onRefresh,
    this.onPageStarted,
    this.onPageFinished,
    this.navigationDelegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcWhite,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            CupertinoIcons.back,
            color: kcDarkGreyColor,
          ),
        ),
        title: Text(
          title,
          style: ktsDarkGreyTextStyle,
        ),
      ),
      body: Column(
        children: [
          verticalSpaceMedium,
          Expanded(
            child: initialUrl == null || isBusy
                ? _BusyWidget()
                : _WebView(
                    initialUrl: initialUrl!,
                    isWebViewLoading: isWebViewLoading,
                    hasError: hasError,
                    loadingText: loadingText,
                    errorText: errorText,
                    onRefresh: onRefresh,
                    onPageStarted: onPageStarted,
                    onPageFinished: onPageFinished,
                    navigationDelegate: navigationDelegate,
                  ),
          )
        ],
      ),
    );
  }
}

class _WebView extends StatelessWidget {
  final String initialUrl;
  final bool isWebViewLoading;
  final bool hasError;
  final String? loadingText;
  final String? errorText;
  final Function()? onRefresh;
  final Function(String)? onPageStarted;
  final Function(String)? onPageFinished;
  final NavigationDelegate? navigationDelegate;

  const _WebView({
    Key? key,
    required this.initialUrl,
    required this.isWebViewLoading,
    required this.hasError,
    this.loadingText,
    this.errorText,
    this.onRefresh,
    this.onPageStarted,
    this.onPageFinished,
    this.navigationDelegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasError
        ? ErrorMessage(
            errorText: errorText ?? 'Something Went Wrong',
            onRefresh: onRefresh,
          )
        : Stack(
            children: [
              WebView(
                debuggingEnabled: true,
                initialUrl: initialUrl,
                onPageStarted: onPageStarted,
                onPageFinished: onPageFinished,
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: navigationDelegate,
              ),
              if (isWebViewLoading)
                _LoadingWebView(
                  loadingText: loadingText,
                )
            ],
          );
  }
}

class _BusyWidget extends StatelessWidget {
  const _BusyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: SpinKitThreeBounce(
          color: kcPrimaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}

class _LoadingWebView extends StatelessWidget {
  final String? loadingText;

  const _LoadingWebView({Key? key, this.loadingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitThreeBounce(
              color: kcPrimaryColor,
              size: 20.0,
            ),
            verticalSpaceMedium,
            Text(
              loadingText ?? 'Loading..',
              textAlign: TextAlign.center,
              style: ktsDarkSmallTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String errorText;
  final Function()? onRefresh;
  const ErrorMessage(
      {Key? key, required this.errorText, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:
            screenWidth(context) - screenWidthFraction(context, dividedBy: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpaceMedium,
            Text(
              errorText,
              textAlign: TextAlign.center,
              style: ktsSmallDarkTextStyle,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              iconSize: 50,
              onPressed: onRefresh,
              color: kcPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
