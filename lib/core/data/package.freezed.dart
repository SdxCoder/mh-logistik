// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
mixin _$Package {
  String get id => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  RackLocation get rackLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res>;
  $Res call({String id, String details, RackLocation rackLocation});

  $RackLocationCopyWith<$Res> get rackLocation;
}

/// @nodoc
class _$PackageCopyWithImpl<$Res> implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

  final Package _value;
  // ignore: unused_field
  final $Res Function(Package) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? details = freezed,
    Object? rackLocation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      rackLocation: rackLocation == freezed
          ? _value.rackLocation
          : rackLocation // ignore: cast_nullable_to_non_nullable
              as RackLocation,
    ));
  }

  @override
  $RackLocationCopyWith<$Res> get rackLocation {
    return $RackLocationCopyWith<$Res>(_value.rackLocation, (value) {
      return _then(_value.copyWith(rackLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$$_PackageCopyWith(
          _$_Package value, $Res Function(_$_Package) then) =
      __$$_PackageCopyWithImpl<$Res>;
  @override
  $Res call({String id, String details, RackLocation rackLocation});

  @override
  $RackLocationCopyWith<$Res> get rackLocation;
}

/// @nodoc
class __$$_PackageCopyWithImpl<$Res> extends _$PackageCopyWithImpl<$Res>
    implements _$$_PackageCopyWith<$Res> {
  __$$_PackageCopyWithImpl(_$_Package _value, $Res Function(_$_Package) _then)
      : super(_value, (v) => _then(v as _$_Package));

  @override
  _$_Package get _value => super._value as _$_Package;

  @override
  $Res call({
    Object? id = freezed,
    Object? details = freezed,
    Object? rackLocation = freezed,
  }) {
    return _then(_$_Package(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      rackLocation: rackLocation == freezed
          ? _value.rackLocation
          : rackLocation // ignore: cast_nullable_to_non_nullable
              as RackLocation,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Package implements _Package {
  const _$_Package(
      {required this.id, required this.details, required this.rackLocation});

  factory _$_Package.fromJson(Map<String, dynamic> json) =>
      _$$_PackageFromJson(json);

  @override
  final String id;
  @override
  final String details;
  @override
  final RackLocation rackLocation;

  @override
  String toString() {
    return 'Package(id: $id, details: $details, rackLocation: $rackLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Package &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality()
                .equals(other.rackLocation, rackLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(rackLocation));

  @JsonKey(ignore: true)
  @override
  _$$_PackageCopyWith<_$_Package> get copyWith =>
      __$$_PackageCopyWithImpl<_$_Package>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageToJson(this);
  }
}

abstract class _Package implements Package {
  const factory _Package(
      {required final String id,
      required final String details,
      required final RackLocation rackLocation}) = _$_Package;

  factory _Package.fromJson(Map<String, dynamic> json) = _$_Package.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get details => throw _privateConstructorUsedError;
  @override
  RackLocation get rackLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PackageCopyWith<_$_Package> get copyWith =>
      throw _privateConstructorUsedError;
}
