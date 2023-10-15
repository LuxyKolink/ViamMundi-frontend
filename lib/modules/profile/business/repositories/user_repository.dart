import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser({required String id});
  Future<UserEntity> getAllUsers();
}
