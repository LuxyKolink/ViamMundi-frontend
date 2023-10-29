import 'package:viammundi_frontend/modules/profile/business/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

class GetUser {
  final AuthRepository repository;

  GetUser(this.repository);

  // Future<UserEntity> call({required String id}) async {
  //   return await repository.findOne(userId: id);
  // }
}
