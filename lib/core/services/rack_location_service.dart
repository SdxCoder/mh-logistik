import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/rack_location.dart';

import 'firebase/iFirebaseCrudService.dart';

@injectable
class RackLocationService extends FirebaseCrudService<RackLocation> {
  RackLocationService()
      : super('rack_locations', fromDS: (id, json) => RackLocation.fromJson(json!));
}

