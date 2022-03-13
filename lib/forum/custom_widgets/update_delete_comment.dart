import 'package:beetle/forum/custom_widgets/search_bar.dart';
import 'package:beetle/forum/custom_widgets/update_comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../custom_widgets/image_picker_tile_bottomsheet.dart';
import '../../utilities/beetle_networking.dart';
import '../../utilities/constants.dart';

class UpdateDeleteComment extends StatefulWidget {
  final String userName;
  final String comment;
  final String commentId;
  final String forumId;

  const UpdateDeleteComment({
    required this.commentId,
    required this.comment,
    required this.userName,
    required this.forumId,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateDeleteComment> createState() => _UpdateDeleteCommentState();
}

class _UpdateDeleteCommentState extends State<UpdateDeleteComment> {
  bool _progress = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0,
      inAsyncCall: _progress,
      child: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(10),
        decoration: kForumCardDecoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImagePickerTileBottomSheet(
              text: 'Delete Comment',
              icon: Icons.delete_outline,
              onTap: () async {
                setState(() {
                  _progress = true;
                });
                Response response = await BeetleNetworking()
                    .deleteComment(widget.forumId, widget.commentId);
                if (response.statusCode == 200) {
                  Navigator.pop(context);
                }
              },
            ),
            const SizedBox(
              child: Divider(color: Colors.black),
            ),
            ImagePickerTileBottomSheet(
              text: 'Update Comment',
              icon: Icons.error_outline,
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  backgroundColor: const Color(0x00ffffff),
                  context: context,
                  builder: (context) {
                    return UpdateComment(
                      commentId: widget.commentId,
                      comment: widget.comment,
                      userName: widget.userName,
                      forumId: widget.forumId,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
