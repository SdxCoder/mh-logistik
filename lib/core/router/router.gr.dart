// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:mh_logistik/core/data/package.dart' as _i7;
import 'package:mh_logistik/src/home/homeView.dart' as _i2;
import 'package:mh_logistik/src/package/add_package_view.dart' as _i3;
import 'package:mh_logistik/src/signature/signature_view.dart' as _i4;
import 'package:mh_logistik/src/splash/splashView.dart' as _i1;

class NavRouter extends _i5.RootStackRouter {
  NavRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    HomeViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    AddPackageViewRoute.name: (routeData) {
      final args = routeData.argsAs<AddPackageViewRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.AddPackageView(
              key: args.key,
              scanResult: args.scanResult,
              package: args.package));
    },
    SignatureViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.SignatureView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashViewRoute.name, path: '/'),
        _i5.RouteConfig(HomeViewRoute.name, path: '/home-view'),
        _i5.RouteConfig(AddPackageViewRoute.name, path: '/add-package-view'),
        _i5.RouteConfig(SignatureViewRoute.name, path: '/signature-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashViewRoute extends _i5.PageRouteInfo<void> {
  const SplashViewRoute() : super(SplashViewRoute.name, path: '/');

  static const String name = 'SplashViewRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i5.PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '/home-view');

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i3.AddPackageView]
class AddPackageViewRoute extends _i5.PageRouteInfo<AddPackageViewRouteArgs> {
  AddPackageViewRoute(
      {_i6.Key? key, required String scanResult, _i7.Package? package})
      : super(AddPackageViewRoute.name,
            path: '/add-package-view',
            args: AddPackageViewRouteArgs(
                key: key, scanResult: scanResult, package: package));

  static const String name = 'AddPackageViewRoute';
}

class AddPackageViewRouteArgs {
  const AddPackageViewRouteArgs(
      {this.key, required this.scanResult, this.package});

  final _i6.Key? key;

  final String scanResult;

  final _i7.Package? package;

  @override
  String toString() {
    return 'AddPackageViewRouteArgs{key: $key, scanResult: $scanResult, package: $package}';
  }
}

/// generated route for
/// [_i4.SignatureView]
class SignatureViewRoute extends _i5.PageRouteInfo<void> {
  const SignatureViewRoute()
      : super(SignatureViewRoute.name, path: '/signature-view');

  static const String name = 'SignatureViewRoute';
}
