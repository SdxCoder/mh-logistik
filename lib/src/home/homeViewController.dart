import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/manager/imageManager.dart';
import 'package:mh_logistik/core/router/router.dart';
import 'package:mh_logistik/core/router/router.gr.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';

import '../../core/manager/ml_service.dart';

@injectable
class HomeViewController extends BaseController {
  final ImageManager imageManager;
  final currentIndex = 1.obs;

  HomeViewController(this.imageManager);

  Future getText() async {
    final image = await imageManager.openGallery();

    ///
    await image.when(
        success: (v) async {
          if (v != null) {
            final scanResult = await MLService.getText(path: v.path);
            appRouter.push(AddPackageViewRoute(scanResult: scanResult));
          }
        },
        error: (msg) {});


    currentIndex.value = 1;
   
  }

  late Worker _indexWorker;

  @override
  void onInit() {
    super.onInit();

    _indexWorker = ever(currentIndex, (int i) async {
      if (i == 2) {
        await getText();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _indexWorker.dispose();
  }
}
