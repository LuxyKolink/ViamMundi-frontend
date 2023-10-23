import '../entities/dto/dto_edit_profile_entity.dart';
import '../entities/dto/dto_follow_entity.dart';
import '../entities/followed_entity.dart';
import '../entities/following_entity.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> updateUser(String userId, UserEntity user);
  Future<UserEntity> editProfileService(DtoEditProfileEntity useEdit);
  Future<UserEntity> getProfileService(String userId);
  Future<UserEntity> updateProfileService(String userId, UserEntity user);
  Future<FollowingEntity> findOneFollowing(String userId);
  Future<FollowedEntity> findOneFollower(String userId);
  Future<FollowingEntity> createUserFollowing(String userId);
  Future<FollowedEntity> createUserFollowers(String userId);
  Future<FollowingEntity> updateFollowing(DtoFollowEntity follow);
  Future<FollowedEntity> updateFollower(DtoFollowEntity follow);
  Future<FollowingEntity> findOneFollowingUsers(DtoFollowEntity follow);
  Future<FollowedEntity> findOneFollowerUsers(DtoFollowEntity follow);
  Future<List<UserEntity>> searchProfiles();
  dynamic namesCoincidences(String name, List<String> arrayProfiles);
}
