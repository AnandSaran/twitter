import 'dart:async';

import 'models/models.dart';

abstract class PostRepository {
  Future<void> addNewPost(Post post);

  Future<void> deletePost(Post post);

  Stream<List<Post>> posts();

  Future<void> updatePost(Post post);
}
