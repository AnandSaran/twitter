import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post_repository/constants/constant.dart';
import 'package:post_repository/post_repository.dart';
import 'package:twitter/bloc/post/post_bloc.dart';
import 'package:twitter/bloc/post/post_event.dart';
import 'package:twitter/constants/constant.dart';
import 'package:twitter/screen/widget/widget.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postAvatar(),
          postBody(context),
        ],
      ),
    );
  }

  Widget postAvatar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(this.post.userAvatar),
      ),
    );
  }

  Widget postBody(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postHeader(),
          postText(),
          postButtons(context),
        ],
      ),
    );
  }

  Widget postHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            this.post.username,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
        ),
        Text(
          '',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget postText() {
    return Text(
      this.post.postContent,
      overflow: TextOverflow.clip,
    );
  }

  Widget postButtons(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          postIconButton(ICON_COMMENT, text: post.comments),
          postIconButton(ICON_RETWEET, text: post.retweets),
          postIconButton(ICON_HEART, text: post.favorites),
          postIconButton(ICON_SHARE),
          InkWell(
            onTap: () {
              showDeleteDialog(context);
            },
            child: postIconButton(ICON_DELETE),
          ),
        ],
      ),
    );
  }

  Widget postIconButton(String icon, {String text = EMPTY_STRING}) {
    return Row(
      children: [
        SvgPicture.asset(icon,
            width: 18.0, height: 18.0, color: Colors.black45),
        dividerSpace(width: 4),
        Visibility(
          child: Container(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black45,
                fontSize: 14.0,
              ),
            ),
          ),
          visible: text.trim().isNotEmpty,
        ),
      ],
    );
  }

  showDeleteDialog(BuildContext postWidgetContext) {
    return showDialog<void>(
      context: postWidgetContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(TITLE_DELETE),
          content: Text(MESSAGE_DELETE),
          actions: <Widget>[
            TextButton(
              child: const Text(NO),
              onPressed: () {
                onPressNegativeButton(postWidgetContext);
              },
            ),
            TextButton(
              child: const Text(YES),
              onPressed: () {
                onPressPositiveButton(postWidgetContext);
              },
            ),
          ],
        );
      },
    );
  }

  void onPressPositiveButton(BuildContext context) {
    Navigator.of(context).pop();
    context.read<PostBloc>().add(DeletePost(post));
  }

  void onPressNegativeButton(BuildContext context) {
    Navigator.of(context).pop();
  }
}
