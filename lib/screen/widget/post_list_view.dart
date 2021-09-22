import 'package:flutter/material.dart';
import 'package:post_repository/post_repository.dart';
import 'package:twitter/screen/widget/post_widget.dart';

class PostListView extends StatelessWidget {
  final String userId;
  final List<Post> posts;
  final Function(Post) onTapPostEdit;

  PostListView({
    Key? key,
    required this.userId,
    required this.posts,
    required this.onTapPostEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return postListView(context);
  }

  ListView postListView(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        Post post = posts[index];
        return PostWidget(
            post: post,
            isSameUserPost: isSameUserPost(post),
            onTapPostEdit: onTapPostEdit);
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1,
      ),
    );
  }

  bool isSameUserPost(Post post) => (userId == post.userId);
}
