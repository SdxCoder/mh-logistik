import 'package:freezed_annotation/freezed_annotation.dart';

part 'rack_location.freezed.dart';
part 'rack_location.g.dart';

@freezed
class RackLocation with _$RackLocation {
  const factory RackLocation({
    required String id,
    required String name,
  }) = _RackLocation;

  factory RackLocation.empty() {
    return const RackLocation(id: '', name: '');
  }

  factory RackLocation.fromJson(Map<String, dynamic> json) =>
      _$RackLocationFromJson(json);
}
