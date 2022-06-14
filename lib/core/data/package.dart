import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mh_logistik/core/data/rack_location.dart';

part 'package.freezed.dart';
part 'package.g.dart';

@freezed
class Package with _$Package {
   // ignore: invalid_annotation_target
   @JsonSerializable(explicitToJson: true)
  const factory Package({
    required String id,
    required String details,
    required RackLocation rackLocation,
  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}
