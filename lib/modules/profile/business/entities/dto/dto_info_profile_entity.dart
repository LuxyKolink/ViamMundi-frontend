class DtoInfoProfileEntity {
  final String userId;
  final String userName;
  final String? description;
  final String? imgProfile;
  final int intSeguidores;
  final int intSeguidos;
  final int numberRoutes;

  const DtoInfoProfileEntity({
    required this.userId,
    required this.userName,
    this.description,
    this.imgProfile,
    required this.intSeguidores,
    required this.intSeguidos,
    required this.numberRoutes,
  });
}
