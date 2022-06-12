
import 'package:mh_logistik/core/router/router.dart';
import 'package:mh_logistik/core/router/router.gr.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';


class SplashViewController extends BaseController {

  

  void _handleStartUp() async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 3));
    setBusy(false);

     appRouter.pushAndPopUntil(const HomeViewRoute(), predicate: (v) => false);

  }

  @override
  void onInit() {
    super.onInit();
    _handleStartUp();
  }


}