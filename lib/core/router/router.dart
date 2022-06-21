import 'package:auto_route/annotations.dart';
import 'package:get/get.dart';
import 'package:mh_logistik/core/router/router.gr.dart';
import 'package:mh_logistik/src/package/add_package_view.dart';
import 'package:mh_logistik/src/splash/splashView.dart';

import '../../src/home/homeView.dart';
import '../../src/signature/signature_view.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
 AutoRoute(page: SplashView, initial: true),
 AutoRoute(page: HomeView),
 AutoRoute(page: AddPackageView),
 AutoRoute(page: SignatureView),

])

class $NavRouter {}

final appRouter = NavRouter(Get.rootController.key);
