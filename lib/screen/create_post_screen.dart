import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:twitter/bloc/post/post_bloc.dart';
import 'package:twitter/bloc/post/post_event.dart';
import 'package:twitter/constants/constant.dart';
import 'package:twitter/model/data_model/cretae_post_dtata_model.dart';
import 'package:twitter/style/theme.dart' as Theme;
import 'package:twitter/util/navigation.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _tecContent = TextEditingController();
  late CreatePostDataModel createPostDataModel;
  String _title = TITLE_CREATE_POST;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createPostDataModel =
        ModalRoute.of(context)!.settings.arguments as CreatePostDataModel;
    if (createPostDataModel.isEdit) {
      _title = TITLE_EDIT_POST;
      _tecContent.text = createPostDataModel.post.postContent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          backgroundColor: Theme.AppColors.toolBarBackgroundColor,
        ),
        body: _body(context));
  }

  _body(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
                children: [_editTextContent(), _buttonSubmit(context)])));
  }

  _editTextContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextFormField(
        controller: _tecContent,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        maxLines: CREATE_POST_CONTENT_MAX_LINE,
        maxLength: CREATE_POST_CONTENT_MAX_LENGTH,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            labelText: HINT_CREATE_POST_CONTENT,
            labelStyle: TextStyle(fontSize: 14.0),
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buttonSubmit(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: Text(POST, style: TextStyle(color: Colors.white)),
      onPressed: () {
        _onTapSubmit(context);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0),
        ),
      ),
    ));
  }

  void _onTapSubmit(BuildContext context) {
    bool isValidContent = validateContent(context);
    if (isValidContent) {
      submitPost(context);
    }
  }

  void submitPost(BuildContext context) {
    if (createPostDataModel.isEdit) {
      updatePost(context);
    } else {
      addPost(context);
    }
  }

  bool validateContent(BuildContext context) {
    if (_tecContent.text.trim().isNotEmpty) {
      return true;
    } else {
      showToast(context, ERROR_POST_CONTENT);
      return false;
    }
  }

  void showToast(BuildContext context, String message) {
    Navigation().showToast(context, message);
  }

  void addPost(BuildContext context) {
    Post post = generatePost();
    BlocProvider.of<PostBloc>(context).add(AddPost(post));
    Navigation().pop(context);
  }

  void updatePost(BuildContext context) {
    Post post = generatePost();
    BlocProvider.of<PostBloc>(context).add(UpdatePost(post));
    Navigation().pop(context);
  }

  Post generatePost() {
    User user = createPostDataModel.user;
    Post post = Post(
      id: createPostDataModel.post.id,
      username: user.name.toString(),
      userAvatar: user.photo.toString(),
      userId: user.id,
      postContent: _tecContent.text.trim(),
    );
    return post;
  }
}
