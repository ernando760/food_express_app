import 'dart:convert';

class CommentEntity {
  final String? id;
  final String username;
  final String email;
  final double ratings;
  final String comment;
  final DateTime? createTime;

  CommentEntity(
      {this.id,
      required this.username,
      required this.email,
      this.ratings = 0,
      required this.comment,
      this.createTime});

  CommentEntity copyWith({
    String? id,
    String? username,
    String? email,
    double? ratings,
    String? comment,
    DateTime? createTime,
  }) {
    return CommentEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      ratings: ratings ?? this.ratings,
      comment: comment ?? this.comment,
      createTime: createTime ?? this.createTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'ratings': ratings,
      'comment': comment,
      'createTime': createTime?.toString(),
    };
  }

  factory CommentEntity.fromMap(Map<String, dynamic> map) {
    return CommentEntity(
      id: map['id'],
      username: map['username'] as String,
      email: map['email'] as String,
      ratings: map['ratings'] as double,
      comment: map['comment'] as String,
      createTime: map["create_time"] != null
          ? DateTime.parse(map["create_time"])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentEntity.fromJson(String source) =>
      CommentEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentEntity(id: $id, username: $username, email: $email, ratings: $ratings, comment: $comment, createTime: $createTime)';
  }

  @override
  bool operator ==(covariant CommentEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.email == email &&
        other.ratings == ratings &&
        other.comment == comment &&
        other.createTime == createTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        ratings.hashCode ^
        comment.hashCode ^
        createTime.hashCode;
  }
}
