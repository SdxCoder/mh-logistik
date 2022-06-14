// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'metaData.dart';

// part 'user.freezed.dart';
// part 'user.g.dart';



// @freezed
// class UserProfile with _$UserProfile {


//   // ignore: invalid_annotation_target
//   @JsonSerializable(explicitToJson: true)
//   const factory UserProfile({
//     required String id,
//     required double currentWeight,
//     required double desiredWeight,
//     required double height,
//     required DateTime dob,
//     required String gender,
//     required DateTime reminder,
//     required DateTime currentWeightLastUpdated,
//     required DateTime desiredWeightLastUpdated,
//     MetaData? metaData,
//   }) = _UserProfile;

//   static UserProfile withID(String id) => UserProfile(
//         id: id,
//         currentWeight: 0,
//         desiredWeight: 0,
//         height: 0,
//         dob: DateTime(0),
//         gender: '',
//         reminder: DateTime(0),
//         currentWeightLastUpdated: DateTime(0),
//         desiredWeightLastUpdated: DateTime(0),
//       );

//   static UserProfile empty() => UserProfile(
//         id: '',
//         currentWeight: 0,
//         desiredWeight: 0,
//         height: 0,
//         dob: DateTime(0),
//         gender: '',
//         reminder: DateTime(0),
//          currentWeightLastUpdated: DateTime(0),
//         desiredWeightLastUpdated: DateTime(0),
//       );

  // factory UserProfile.fromJson(Map<String, dynamic> json) =>
  //     _$UserProfileFromJson(json);
// }
