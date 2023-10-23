class UserEntity {
  final String id;
  final int userType;
  final int userStatus;
  final String name;
  final String email;
  final String password;
  final int followers;
  final int followeds;
  final String description;
  final String imgProfile;
  final String tokenFingerprint;
  final String tokenDevice;
  final String recoveryCode;
  final int routesNumber;

  const UserEntity(
      {required this.id,
      required this.userType,
      required this.userStatus,
      required this.name,
      required this.email,
      required this.password,
      required this.followers,
      required this.followeds,
      required this.description,
      required this.imgProfile,
      required this.tokenFingerprint,
      required this.tokenDevice,
      required this.recoveryCode,
      required this.routesNumber});
}
