import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

///
/// Sealed classes for the result
/// Success and Error
///
@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success([T? data]) = _Success<T>;
  const factory Result.error(String message) = _Error<T>;
}

