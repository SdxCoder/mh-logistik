import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/services/package_service.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';
import 'package:mh_logistik/core/utils/snack_msg.dart';
import 'package:uuid/uuid.dart';

@injectable
class AddPackageViewController extends BaseController {
  final PackageService packageService;

  final scanResult = ''.obs;
  final rackLocation = RackLocation.empty().obs;
  final rackLocationList = [
    const RackLocation(id: "1", name: "A1"),
    const RackLocation(id: "2", name: "A2"),
    const RackLocation(id: "3", name: "P28"),
  ].obs;

  AddPackageViewController(this.packageService);

  Future save() async {
    if (rackLocation.value == RackLocation.empty()) {
      SnackMsg.err('Rack location is required.');
      return;
    }

    final result = await packageService.save(Package(
            id: const Uuid().v1(),
            details: scanResult.value,
            rackLocation: rackLocation.value)
        .toJson());

    result.when(success: (data) {
      SnackMsg.success("Saved successfully.");
    }, error: (msg) {
      SnackMsg.err(msg);
    });
  }

  

}
