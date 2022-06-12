import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/manager/imageManager.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';

import '../../core/manager/ml_service.dart';

@injectable
class HomeViewController extends BaseController {
  final ImageManager imageManager;

  HomeViewController( this.imageManager);


  final text = ''.obs;

  

  Future getText() async {
    final image = await imageManager.openGallery();
    /// 
    image.when(
        success: (v) async {

          if (v != null) {
            text.value = await MLService.getText(path: v.path);
          }
          
        },
        error: (msg) {});

  }
}
