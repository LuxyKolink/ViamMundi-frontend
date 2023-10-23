class DtoEditProfileEntity {
  final String userId;
  final String userName;
  final String? description;
  final String? imgProfile;

  const DtoEditProfileEntity({
    required this.userId,
    required this.userName,
    this.description,
    this.imgProfile,
  });
}
