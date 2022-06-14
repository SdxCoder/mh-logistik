import 'dart:async';

import 'package:get/state_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/rack_location.dart';
import 'package:mh_logistik/core/services/rack_location_service.dart';
import 'package:mh_logistik/core/shared_widgets/dialogs/update_rack_location_dialog.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';
import 'package:uuid/uuid.dart';

import '../../core/data/package.dart';
import '../../core/shared_widgets/dialogs/delete_dialog.dart';
import '../../core/utils/snack_msg.dart';
import '../../core/utils/utils.dart';

@injectable
class RackLocationsViewController extends BaseController {
  RackLocationsViewController(this.rackLocationService);

  final RackLocationService rackLocationService;
  final locationsList = RxList<RackLocation>();
  final locationName = ''.obs;

  late StreamSubscription<List<RackLocation>> _streamSubscription;

  void _listenToPackageStream() {
    _streamSubscription = rackLocationService.stream().listen((data) {
      locationsList.value = data;
    });
  }

  Future save() async {
    if (locationName.value.isEmpty) {
      SnackMsg.err('Location required.');
      return;
    }

    final id = locationName.value.toUpperCase();

    final result = await rackLocationService.save(
        RackLocation(id: id, name: locationName.value.toUpperCase()).toJson(),
        id: id);

    result.when(success: (data) {
      // SnackMsg.success("Saved successfully.");
        locationName.value = '';
    }, error: (msg) {
      SnackMsg.err(msg);
    });
  }

  Future updateRackloaction(RackLocation rackLocation) async {
    final name = await Utils.dialog<String>(UpdateRackLocationDialog());

    if (name != null) {
      final result = await rackLocationService.update(
          rackLocation.id, rackLocation.copyWith(name: name).toJson());

      result.when(success: (data) {
       // SnackMsg.success("Updated successfully.");
      }, error: (msg) {
        SnackMsg.err(msg);
      });
    }
  }

  Future delete(String id) async {
    final delete = await Utils.dialog(const DeleteDialog());

    //
    if (delete != null && delete) {
      final result = await rackLocationService.delete(id);

      result.when(success: (d) {
        // SnackMsg.success('Deleted Successfuly.', pop: false);
      }, error: (msg) {
        SnackMsg.err(msg);
      });
    }
  }

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
