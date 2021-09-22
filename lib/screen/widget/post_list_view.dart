import 'package:flutter/material.dart';
import 'package:post_repository/post_repository.dart';
import 'package:twitter/screen/widget/post_widget.dart';

class PostListView extends StatelessWidget {
  final List<Post> posts;

  PostListView({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return postListView(context, posts);
  }
}

ListView postListView(BuildContext context, List<Post> posts) {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    itemCount: posts.length,
    itemBuilder: (context, index) {
      Post post = posts[index];
      return PostWidget(post: post);
    },
    separatorBuilder: (BuildContext context, int index) => Divider(
      height: 1,
    ),
  );
}
