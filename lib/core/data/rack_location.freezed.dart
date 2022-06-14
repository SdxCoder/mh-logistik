// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rack_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RackLocation _$RackLocationFromJson(Map<String, dynamic> json) {
  return _RackLocation.fromJson(json);
}

/// @nodoc
mixin _$RackLocation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RackLocationCopyWith<RackLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RackLocationCopyWith<$Res> {
  factory $RackLocationCopyWith(
          RackLocation value, $Res Function(RackLocation) then) =
      _$RackLocationCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$RackLocationCopyWithImpl<$Res> implements $RackLocationCopyWith<$Res> {
  _$RackLocationCopyWithImpl(this._value, this._then);

  final RackLocation _value;
  // ignore: unused_field
  final $Res Function(RackLocation) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RackLocationCopyWith<$Res>
    implements $RackLocationCopyWith<$Res> {
  factory _$$_RackLocationCopyWith(
          _$_RackLocation value, $Res Function(_$_RackLocation) then) =
      __$$_RackLocationCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$$_RackLocationCopyWithImpl<$Res>
    extends _$RackLocationCopyWithImpl<$Res>
    implements _$$_RackLocationCopyWith<$Res> {
  __$$_RackLocationCopyWithImpl(
      _$_RackLocation _value, $Res Function(_$_RackLocation) _then)
      : super(_value, (v) => _then(v as _$_RackLocation));

  @override
  _$_RackLocation get _value => super._value as _$_RackLocation;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_RackLocation(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RackLocation implements _RackLocation {
  const _$_RackLocation({required this.id, required this.name});

  factory _$_RackLocation.fromJson(Map<String, dynamic> json) =>
      _$$_RackLocationFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'RackLocation(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RackLocation &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_RackLocationCopyWith<_$_RackLocation> get copyWith =>
      __$$_RackLocationCopyWithImpl<_$_RackLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RackLocationToJson(this);
  }
}

abstract class _RackLocation implements RackLocation {
  const factory _RackLocation(
      {required final String id, required final String name}) = _$_RackLocation;

  factory _RackLocation.fromJson(Map<String, dynamic> json) =
      _$_RackLocation.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RackLocationCopyWith<_$_RackLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
