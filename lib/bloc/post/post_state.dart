import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  const PostLoaded([this.posts = const []]);

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'PostLoaded { posts: $posts }';
}

class PostNotLoaded extends PostState {}
