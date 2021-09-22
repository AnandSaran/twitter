import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {}

class AddPost extends PostEvent {
  final Post post;

  const AddPost(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'AddPost { post: $post }';
}

class UpdatePost extends PostEvent {
  final Post updatedPost;

  const UpdatePost(this.updatedPost);

  @override
  List<Object> get props => [updatedPost];

  @override
  String toString() => 'UpdatePost { updatedPost: $updatedPost }';
}

class DeletePost extends PostEvent {
  final Post post;

  const DeletePost(this.post);

  @override
  List<Object> get props => [post];

  @override
  String toString() => 'DeletePost { post: $post }';
}

class PostUpdated extends PostEvent {
  final List<Post> post;

  const PostUpdated(this.post);

  @override
  List<Object> get props => [post];
}
