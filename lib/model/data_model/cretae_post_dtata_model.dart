import 'package:authentication_repository/authentication_repository.dart';
import 'package:post_repository/constants/constant.dart';
import 'package:post_repository/post_repository.dart';

class CreatePostDataModel {
  CreatePostDataModel({required this.user, post, isEdit})
      : this.post = post ??
            Post(
                id: EMPTY_STRING,
                username: EMPTY_STRING,
                userAvatar: EMPTY_STRING,
                userId: EMPTY_STRING,
                postContent: EMPTY_STRING),
        this.isEdit = isEdit ?? false;

  User user;

  Post post;

  bool isEdit;
}
