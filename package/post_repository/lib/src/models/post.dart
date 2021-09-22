import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/constants/constant.dart';

class Post extends Equatable {
  final String id;
  final String username;
  final String userAvatar;
  final String userId;
  final String postContent;

  const Post({
    id,
    required this.username,
    required this.userAvatar,
    required this.userId,
    required this.postContent,
  }) : this.id = id ?? EMPTY_STRING;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'username': username,
      'userAvatar': userAvatar,
      'userId': userId,
      'postContent': postContent,
    };
  }

  @override
  List<Object?> get props => [
        id,
        username,
        userAvatar,
        userId,
        postContent,
      ];

  @override
  String toString() {
    return 'Post { id: $id, username: $username, userAvatar: $userAvatar, userId: $userId, postContent: $postContent}';
  }

  static Post fromJson(Map<String, Object> json) {
    return Post(
        id: json['id'] as String,
        username: json['username'] as String,
        userAvatar: json['userAvatar'] as String,
        userId: json['userId'] as String,
        postContent: json['postContent'] as String);
  }

  static Post fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data();
    if (data == null) throw Exception();
    return Post(
      id: snap.id,
      username: snap.get('username'),
      userAvatar: snap.get('userAvatar'),
      userId: snap.get('userId'),
      postContent: snap.get('postContent'),
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'username': username,
      'userAvatar': userAvatar,
      'userId': userId,
      'postContent': postContent,
      'date': Timestamp.now(),
    };
  }
}
