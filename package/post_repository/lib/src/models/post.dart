import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/constants/constant.dart';

class Post extends Equatable {
  final String id;
  final String username;
  final String userAvatar;
  final String postContent;
  final String comments;
  final String retweets;
  final String favorites;

  const Post({
    id,
    required this.username,
    required this.userAvatar,
    required this.postContent,
    required this.comments,
    required this.retweets,
    required this.favorites,
  }) : this.id = id ?? EMPTY_STRING;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'username': username,
      'userAvatar': userAvatar,
      'postContent': postContent,
      'comments': comments,
      'retweets': retweets,
      'favorites': favorites,
    };
  }

  @override
  List<Object?> get props =>
      [id, username, userAvatar, postContent, comments, retweets, favorites];

  @override
  String toString() {
    return 'Post { id: $id, username: $username, userAvatar: $userAvatar, postContent: $postContent, comments: $comments, retweets: $favorites}';
  }

  static Post fromJson(Map<String, Object> json) {
    return Post(
        id: json['id'] as String,
        username: json['username'] as String,
        userAvatar: json['userAvatar'] as String,
        postContent: json['postContent'] as String,
        comments: json['comments'] as String,
        retweets: json['retweets'] as String,
        favorites: json['favorites'] as String);
  }

  static Post fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data();
    if (data == null) throw Exception();
    return Post(
      id: snap.id,
      username: snap.get('username'),
      userAvatar: snap.get('userAvatar'),
      postContent: snap.get('postContent'),
      comments: snap.get('comments'),
      retweets: snap.get('retweets'),
      favorites: snap.get('favorites'),
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'username': username,
      'userAvatar': userAvatar,
      'postContent': postContent,
      'comments': comments,
      'retweets': retweets,
      'favorites': favorites,
      'date': Timestamp.now(),
    };
  }
}
