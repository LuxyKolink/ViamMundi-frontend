import '../entities/dto/dto_login_user_entity.dart';
import '../entities/dto/dto_register_user_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> findAll();
  Future<UserEntity> findOne(String userId);
  Future<UserEntity> findOneByEmail(String email);
  Future<UserEntity> findOneByTokenFingerPrint(String tokenFingerPrint);
  Future<UserEntity> createUser(DtoRegisterUserEntity registerUserDto);
  String generateJwt(String userId);
  Future<String> verifyJwt(String token);
  Future<UserEntity> verifyRecoveriCode(String recoveriCode);
  Future<UserEntity> loginUser(DtoLoginUserEntity loginUserDto);
  int generateRecoveryCode();
  Future<UserEntity> saveRecoveriCode(String userId, int recoveriCode);
}
