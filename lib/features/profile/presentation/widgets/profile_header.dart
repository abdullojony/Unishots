import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/pages/followers_page.dart';
import 'package:instagram_clone/features/profile/presentation/pages/following_page.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/stat_column.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_actions.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_profile_image.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader(this.user, this.isCurrentUser, {super.key});
  final UserEntity user;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              UserProfileImage(user.profileImage, isCurrentUser: isCurrentUser),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatColumn(user.posts.length, "posts"),
                        StatColumn(user.followers.length, "followers").gestures(
                          onTap: () => isCurrentUser
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      FollowersPage(user.followers.toSet())))
                              : {},
                        ),
                        StatColumn(user.following.length, "following").gestures(
                          onTap: () => isCurrentUser
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      FollowingPage(user.following.toSet())))
                              : {},
                        ),
                      ],
                    ),
                    UserActions(user, isCurrentUser: isCurrentUser),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 15),
            child: Text(user.bio),
          ),
        ],
      ),
    );
  }
}
