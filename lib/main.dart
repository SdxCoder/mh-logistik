import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mh_logistik/src/injection.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/router/router.dart';
import 'core/router/router.gr.dart';
import 'core/utils/appTheme.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase Initialisation
  await Firebase.initializeApp();
  //
  configureDependencies();

  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate:
          appRouter.delegate(initialRoutes: [const SplashViewRoute()]),
      smartManagement: SmartManagement.full,
      fallbackLocale: const Locale("en", "US"),
      enableLog: true,

      /// Env().config.isDev,
      builder: (context, child) => ResponsiveWrapper.builder(
          ClampingScrollWrapper(child: child!),
          maxWidth: 1200,
          minWidth: 360,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(360, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          mediaQueryData: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          backgroundColor: Colors.white,
          background: Container(color: Colors.white),
          defaultScaleFactor: 1),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),

      // theme: AppTheme.lightTheme(),
    );
  }
}
