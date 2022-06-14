// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:mh_logistik/core/data/package.dart' as _i6;
import 'package:mh_logistik/src/home/homeView.dart' as _i2;
import 'package:mh_logistik/src/package/add_package_view.dart' as _i3;
import 'package:mh_logistik/src/splash/splashView.dart' as _i1;

class NavRouter extends _i4.RootStackRouter {
  NavRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashViewRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    HomeViewRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    AddPackageViewRoute.name: (routeData) {
      final args = routeData.argsAs<AddPackageViewRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.AddPackageView(
              key: args.key,
              scanResult: args.scanResult,
              package: args.package));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashViewRoute.name, path: '/'),
        _i4.RouteConfig(HomeViewRoute.name, path: '/home-view'),
        _i4.RouteConfig(AddPackageViewRoute.name, path: '/add-package-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashViewRoute extends _i4.PageRouteInfo<void> {
  const SplashViewRoute() : super(SplashViewRoute.name, path: '/');

  static const String name = 'SplashViewRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i4.PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '/home-view');

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i3.AddPackageView]
class AddPackageViewRoute extends _i4.PageRouteInfo<AddPackageViewRouteArgs> {
  AddPackageViewRoute(
      {_i5.Key? key, required String scanResult, _i6.Package? package})
      : super(AddPackageViewRoute.name,
            path: '/add-package-view',
            args: AddPackageViewRouteArgs(
                key: key, scanResult: scanResult, package: package));

  static const String name = 'AddPackageViewRoute';
}

class AddPackageViewRouteArgs {
  const AddPackageViewRouteArgs(
      {this.key, required this.scanResult, this.package});

  final _i5.Key? key;

  final String scanResult;

  final _i6.Package? package;

  @override
  String toString() {
    return 'AddPackageViewRouteArgs{key: $key, scanResult: $scanResult, package: $package}';
  }
}
