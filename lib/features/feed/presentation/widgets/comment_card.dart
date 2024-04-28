import 'package:flutter/material.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/domain/entities/comment_entity.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

class CommentCard extends StatelessWidget {
  const CommentCard(
      {required this.comment, required this.isCurrentuser, super.key});
  final CommentEntity comment;
  final bool isCurrentuser;

  void deleteComment(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title:
                  const Text('Do you want to delete the comment?').fontSize(18),
              actions: [
                TextButton(
                    child: const Text('Cancel').textColor(Colors.red),
                    onPressed: () => Navigator.of(ctx).pop()),
                TextButton(
                    onPressed: () {
                      sl.get<FirestoreRepositories>().deleteComment(
                          postId: comment.postId, commentId: comment.commentId);
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Delete')),
              ],
            ));
  }

  void showPopupMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;

    final Offset buttonPosition = button.localToGlobal(Offset.zero);
    final Size buttonSize = button.size;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double dy = buttonPosition.dy + buttonSize.height;
    final double dx = buttonPosition.dx;

    final RelativeRect position = RelativeRect.fromLTRB(
      dx,
      dy,
      MediaQuery.of(context).size.width,
      screenHeight,
    );

    await showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          onTap: () => deleteComment(context),
          child: const Text('Delete'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              comment.profileImageUrl,
            ),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                      children: [
                        TextSpan(
                            text: comment.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                          text: ' ${comment.commentText}',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(
                        DateTime.parse(comment.publishedDate),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              size: 16,
            ),
          )
        ],
      ),
    ).ripple().gestures(
          onLongPress: () => isCurrentuser ? showPopupMenu(context) : {},
        );
  }
}
