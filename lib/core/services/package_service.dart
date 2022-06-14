import 'package:injectable/injectable.dart';
import 'package:mh_logistik/core/data/package.dart';

import 'firebase/iFirebaseCrudService.dart';

@injectable
class PackageService extends FirebaseCrudService<Package> {
  PackageService()
      : super('packages', fromDS: (id, json) => Package.fromJson(json!));


  
}
