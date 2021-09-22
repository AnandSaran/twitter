import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post_repository/post_repository.dart';
import 'package:twitter/bloc/login/login_bloc.dart';
import 'package:twitter/bloc/login/login_event.dart';
import 'package:twitter/bloc/post/post_bloc.dart';
import 'package:twitter/bloc/post/post_state.dart';
import 'package:twitter/constants/constant.dart';
import 'package:twitter/model/data_model/cretae_post_dtata_model.dart';
import 'package:twitter/screen/widget/post_list_view.dart';
import 'package:twitter/style/theme.dart' as Theme;
import 'package:twitter/util/navigation.dart';

import 'widget/loading_indicator.dart';

class PostScreen extends StatelessWidget {
  final User user;

  const PostScreen(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME),
          backgroundColor: Theme.AppColors.toolBarBackgroundColor,
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Theme.AppColors.toolbarIconColor,
                ),
                onPressed: () {
                  _logOut(context);
                },
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: _widgetFab(context),
        body: _blocBuilderPosts(context));
  }

  _blocBuilderPosts(BuildContext buildContext) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostLoading) {
        return LoadingIndicator();
      } else if (state is PostLoaded) {
        return PostListView(
          posts: state.posts,
          userId: user.id,
          onTapPostEdit: (post) {
            onTapEditPost(buildContext, post);
          },
        );
      } else {
        return Container();
      }
    });
  }

  FloatingActionButton _widgetFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showCreatePostScreen(context);
      },
      child: SvgPicture.asset(ICON_QUILL,
          width: 28, height: 28, color: Colors.white),
      backgroundColor: Colors.blue,
    );
  }

  void _logOut(BuildContext context) {
    context.read<LoginBLoc>().add(SignOut());
  }

  void showCreatePostScreen(BuildContext context) {
    Navigation().pushPageWithArgument(
        context, ROUTE_CREATE_POST, CreatePostDataModel(user: user));
  }

  onTapEditPost(BuildContext context, Post post) {
    Navigation().pushPageWithArgument(context, ROUTE_CREATE_POST,
        CreatePostDataModel(user: user, post: post, isEdit: true));
  }
}
