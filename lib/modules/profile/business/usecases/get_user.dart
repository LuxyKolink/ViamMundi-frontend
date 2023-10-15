import 'package:viammundi_frontend/modules/profile/business/entities/user_entity.dart';

import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<UserEntity> call({required String id}) async {
    return await repository.getUser(id: id);
  }
}
