import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    @Default(false) bool destored,
    @BlobConverter() Uint8List? image,

  }) = _Package;

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
}

class BlobConverter implements JsonConverter<Uint8List?, Blob?> {
  const BlobConverter();

  @override
  Uint8List? fromJson(Blob? value) {
    return value?.bytes;
  }

  @override
  Blob? toJson(Uint8List? bytes) => bytes != null ? Blob(bytes) : null;
}
