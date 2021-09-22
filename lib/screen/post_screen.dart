import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/bloc/post/post_bloc.dart';
import 'package:twitter/bloc/post/post_state.dart';
import 'package:twitter/constants/constant.dart';
import 'package:twitter/screen/widget/post_list_view.dart';

import 'widget/loading_indicator.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: _widgetFab(),
        body: _blocBuilderPosts());
  }

  _blocBuilderPosts() {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostLoading) {
        return LoadingIndicator();
      } else if (state is PostLoaded) {
        return PostListView(posts: state.posts);
      } else {
        return Container();
      }
    });
  }

  FloatingActionButton _widgetFab() {
    return FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: SvgPicture.asset(ICON_QUILL,
          width: 28, height: 28, color: Colors.white),
      backgroundColor: Colors.blue,
    );
  }
}
