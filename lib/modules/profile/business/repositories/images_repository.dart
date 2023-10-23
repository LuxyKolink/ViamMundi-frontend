import '../entities/user_entity.dart';

abstract class ImagesRepository {
  Future<UserEntity> editImageProfileService(String imagePath, String userId);
}
