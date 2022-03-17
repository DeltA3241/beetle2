import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../utilities/beetle_networking.dart';
import '../../utilities/constants.dart';
import 'search_bar.dart';
import 'package:beetle/globals.dart' as global;

class UpdateComment extends StatefulWidget {
  final String userName;
  final String comment;
  final String commentId;
  final String forumId;

  const UpdateComment({
    required this.commentId,
    required this.comment,
    required this.userName,
    required this.forumId,
    Key? key,
  }) : super(key: key);
  @override
  State<UpdateComment> createState() => _UpdateCommentState();
}

class _UpdateCommentState extends State<UpdateComment> {
  String newComment = '';
  bool _progress = false;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController()..text = widget.comment;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0,
      inAsyncCall: _progress,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 350,
          right: 20,
        ),
        padding: const EdgeInsets.all(10),
        decoration: kForumCardDecoration,
        //color: Colors.orange,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SearchBar(
                textEditingController: textEditingController,
                onChanged: (value) {
                  newComment = value;
                },
                label: 'Change Comment',
                icon: Icons.messenger_outline_sharp,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () async {
                  setState(() {
                    _progress = true;
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                  Map<String, String> updatedComment = {
                    'creator_id': '${global.userId}',
                    'creator_name': widget.userName,
                    'text': newComment,
                  };
                  Response response = await BeetleNetworking().updateComment(
                    widget.forumId,
                    widget.commentId,
                    updatedComment,
                  );

                  if (response.statusCode == 201) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.done),
              ),
            )
          ],
        ),
      ),
    );
  }
}
