class DtoInfoProfileTileEntity {
  final String userId;
  final String userName;
  final String? imgProfile;

  const DtoInfoProfileTileEntity({
    required this.userId,
    required this.userName,
    this.imgProfile,
  });
}
