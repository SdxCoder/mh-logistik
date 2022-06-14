import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/services/package_service.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';
import 'package:mh_logistik/core/utils/snack_msg.dart';
import 'package:uuid/uuid.dart';

import '../../core/services/rack_location_service.dart';

@injectable
class AddPackageViewController extends BaseController {
  final PackageService packageService;

  final RackLocationService rackLocationService;

  final scanResult = ''.obs;
  final rackLocation = RackLocation.empty().obs;
  final rackLocationList = RxList<RackLocation>([]);

  AddPackageViewController(this.packageService, this.rackLocationService);

  Future _getLocations() async {
    final result = await rackLocationService.getList();
    rackLocationList.value = result;
  }

  Future save() async {
    if (rackLocation.value == RackLocation.empty()) {
      SnackMsg.err('Rack location is required.');
      return;
    }

    final id = const Uuid().v1();

    final result = await packageService.save(
        Package(
                id: id,
                details: scanResult.value,
                rackLocation: rackLocation.value)
            .toJson(),
        id: id);

    result.when(success: (data) {
      SnackMsg.success("Saved successfully.");
    }, error: (msg) {
      SnackMsg.err(msg);
    });
  }

  Future updatePackage(Package package) async {
    if (rackLocation.value == RackLocation.empty()) {
      SnackMsg.err('Rack location is required.');
      return;
    }

    final result = await packageService.update(
        package.id,
        package
            .copyWith(
              details: scanResult.value,
              rackLocation: rackLocation.value,
            )
            .toJson());

    result.when(success: (data) {
      SnackMsg.success("Updated successfully.");
    }, error: (msg) {
      SnackMsg.err(msg);
    });
  }

  @override
  void onInit() {
    super.onInit();
    _getLocations();
  }
}
