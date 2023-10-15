class TypesEntities {
  final TypeEntity type;

  const TypesEntities({
    required this.type,
  });
}

class TypeEntity {
  final String user;
  final String admin;
  final String editor;

  const TypeEntity({
    required this.user,
    required this.admin,
    required this.editor,
  });
}
