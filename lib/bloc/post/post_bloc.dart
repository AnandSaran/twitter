import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:twitter/bloc/post/post_event.dart';
import 'package:twitter/bloc/post/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  StreamSubscription? _postSubscription;

  PostBloc({required PostRepository postRepository})
      : _postRepository = postRepository,
        super(PostLoading());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadPosts) {
      yield* _mapLoadPostsToState();
    } else if (event is AddPost) {
      yield* _mapAddPostToState(event);
    } else if (event is UpdatePost) {
      yield* _mapUpdatePostToState(event);
    } else if (event is DeletePost) {
      yield* _mapDeletePostToState(event);
    } else if (event is PostUpdated) {
      yield* _mapPostsUpdateToState(event);
    }
  }

  Stream<PostState> _mapLoadPostsToState() async* {
    _postSubscription?.cancel();
    _postSubscription = _postRepository.posts().listen(
          (post) => add(PostUpdated(post)),
        );
  }

  Stream<PostState> _mapAddPostToState(AddPost event) async* {
    _postRepository.addNewPost(event.post);
  }

  Stream<PostState> _mapUpdatePostToState(UpdatePost event) async* {
    _postRepository.updatePost(event.updatedPost);
  }

  Stream<PostState> _mapDeletePostToState(DeletePost event) async* {
    _postRepository.deletePost(event.post);
  }

  Stream<PostState> _mapPostsUpdateToState(PostUpdated event) async* {
    yield PostLoaded(event.post);
  }

  @override
  Future<void> close() {
    _postSubscription?.cancel();
    return super.close();
  }
}
