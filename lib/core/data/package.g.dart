// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Package _$$_PackageFromJson(Map<String, dynamic> json) => _$_Package(
      id: json['id'] as String,
      details: json['details'] as String,
      rackLocation:
          RackLocation.fromJson(json['rackLocation'] as Map<String, dynamic>),
      destored: json['destored'] as bool? ?? false,
      image: const BlobConverter().fromJson(json['image'] as Blob?),
    );

Map<String, dynamic> _$$_PackageToJson(_$_Package instance) =>
    <String, dynamic>{
      'id': instance.id,
      'details': instance.details,
      'rackLocation': instance.rackLocation.toJson(),
      'destored': instance.destored,
      'image': const BlobConverter().toJson(instance.image),
    };
