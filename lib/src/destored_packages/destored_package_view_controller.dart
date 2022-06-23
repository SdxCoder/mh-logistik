import 'dart:async';

import 'package:diacritic/diacritic.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/services/package_service.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';

@injectable
class DestoredPackageViewController extends BaseController {
  DestoredPackageViewController(
    this.packageService,
  );

  final PackageService packageService;
  final packageList = RxList<Package>([]);
  final filteredList = RxList<Package>([]);
  final filterText = ''.obs;

  late StreamSubscription<List<Package>> _streamSubscription;

  void _listenToPackageStream() {
    _streamSubscription = packageService.stream().listen((data) {
      //
      packageList.value = data
          .where((element) => element.destored == true && element.image != null)
          .toList();
      //
      filteredList.value = packageList.value;
    });
  }

  /// Filter function
  bool filter(Package p, String val) {
    final query = _prepareString(val);

    final details = _prepareString(p.details);
    final rackLocation = _prepareString(p.rackLocation.name);

    return details.contains(query) || rackLocation.contains(query);
  }

  //
  String _prepareString(String string) =>
      removeDiacritics(string).toLowerCase();

  @override
  void onInit() {
    super.onInit();

    _listenToPackageStream();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}
