// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:mh_logistik/src/home/homeView.dart' as _i2;
import 'package:mh_logistik/src/splash/splashView.dart' as _i1;

class NavRouter extends _i3.RootStackRouter {
  NavRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    HomeViewRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashViewRoute.name, path: '/'),
        _i3.RouteConfig(HomeViewRoute.name, path: '/home-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashViewRoute extends _i3.PageRouteInfo<void> {
  const SplashViewRoute() : super(SplashViewRoute.name, path: '/');

  static const String name = 'SplashViewRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i3.PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '/home-view');

  static const String name = 'HomeViewRoute';
}
