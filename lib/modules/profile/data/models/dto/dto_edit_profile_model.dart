// import '../../../business/entities/dto/dto_edit_profile_entity.dart';

// class DtoEditProfileModel extends DtoEditProfileEntity {
//   final int userId;
//   final String userName;

//   DtoEditProfileModel({
//     required this.userId,
//     required this.userName,
//     String? description,
//     String? imgProfile,
//   }) : super(
//           userId: userId.toString(),
//           userName: userName,
//           description: description,
//           imgProfile: imgProfile,
//         );

//   factory DtoEditProfileModel.fromJson(Map<String, dynamic> json) {
//     return DtoEditProfileModel(
//       userId: json['userId'] as int,
//       userName: json['userName'] as String,
//       description: json['description'] as String?,
//       imgProfile: json['imgProfile'] as String?,
//     );
//   }
// }