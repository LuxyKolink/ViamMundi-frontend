class CommentsEntity {
  final String commentId;
  final String userId;
  final String routeId;
  final String text;

  const CommentsEntity({
    required this.commentId,
    required this.userId,
    required this.routeId,
    required this.text,
  });
}
