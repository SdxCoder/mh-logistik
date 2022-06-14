import 'dart:async';

import 'package:diacritic/diacritic.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/package.dart';
import 'package:mh_logistik/core/services/package_service.dart';
import 'package:mh_logistik/core/shared_widgets/dialogs/delete_dialog.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';
import 'package:mh_logistik/core/utils/snack_msg.dart';
import 'package:mh_logistik/core/utils/utils.dart';

@injectable
class SearchViewController extends BaseController {
  SearchViewController(this.packageService, );

  final PackageService packageService;
  final packageList = RxList<Package>([]);
  final filteredList = RxList<Package>([]);
  final filterText = ''.obs;

  late StreamSubscription<List<Package>> _streamSubscription;

  void _listenToPackageStream() {
    _streamSubscription = packageService.stream().listen((data) {
      packageList.value = data;
      filteredList.value = packageList.value;
    });
  }



  Future delete(String id) async {
    final delete = await Utils.dialog(const DeleteDialog());

    //
    if (delete != null && delete) {
      final result = await packageService.delete(id);

      result.when(success: (d) {
      //  SnackMsg.success('Deleted Successfuly.', pop: false);
      }, error: (msg) {
        SnackMsg.err(msg);
      });
    }
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
