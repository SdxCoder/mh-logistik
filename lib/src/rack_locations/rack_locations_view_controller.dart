import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/services/rack_location_service.dart';
import 'package:mh_logistik/core/utils/base_controller.dart';

@injectable
class RackLocationsViewController extends BaseController {
  RackLocationsViewController(this.rackLocationService);

  final RackLocationService rackLocationService;
}
