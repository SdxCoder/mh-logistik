

import 'package:get/get.dart';

class BaseController extends GetxController {
  final _busy = false.obs;
  final _isLoading = false.obs;

 

  RxBool get busy => _busy;
  RxBool get isLoading => _isLoading;

  void setBusy(bool value) {
    _busy.value = value;
  }

  void setLoading(bool value){
    _isLoading.value = value;
  }
}
