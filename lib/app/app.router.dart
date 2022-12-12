// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:conference_app/ui/views/contact_us/contact_us_view.dart' as _i4;
import 'package:conference_app/ui/views/home_view/home_view.dart' as _i2;
import 'package:conference_app/ui/views/hotels/hotels_view.dart' as _i5;
import 'package:conference_app/ui/views/web_view/web_view.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const homeView = '/home-view';

  static const registerWebView = '/register-web-view';

  static const contactUsView = '/contact-us-view';

  static const hotelsView = '/hotels-view';

  static const all = <String>{
    homeView,
    registerWebView,
    contactUsView,
    hotelsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.registerWebView,
      page: _i3.RegisterWebView,
    ),
    _i1.RouteDef(
      Routes.contactUsView,
      page: _i4.ContactUsView,
    ),
    _i1.RouteDef(
      Routes.hotelsView,
      page: _i5.HotelsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i6.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.RegisterWebView: (data) {
      final args = data.getArgs<RegisterWebViewArguments>(nullOk: false);
      return _i6.CupertinoPageRoute<dynamic>(
        builder: (context) => _i3.RegisterWebView(
            key: args.key, url: args.url, title: args.title),
        settings: data,
      );
    },
    _i4.ContactUsView: (data) {
      return _i6.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i4.ContactUsView(),
        settings: data,
      );
    },
    _i5.HotelsView: (data) {
      return _i6.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i5.HotelsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RegisterWebViewArguments {
  const RegisterWebViewArguments({
    this.key,
    required this.url,
    required this.title,
  });

  final _i7.Key? key;

  final String url;

  final String title;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterWebView({
    _i7.Key? key,
    required String url,
    required String title,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerWebView,
        arguments: RegisterWebViewArguments(key: key, url: url, title: title),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactUsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactUsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHotelsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.hotelsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
