import 'package:flutter/material.dart';

class ProfileTabbar extends StatelessWidget {
  const ProfileTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 0,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.black,
      elevation: 1,
      pinned: true,
      bottom: TabBar(
        indicatorColor: Theme.of(context).primaryColorDark,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 1,
        tabs: [
          Tab(
              icon: Icon(
            Icons.grid_on_outlined,
            color: Theme.of(context).primaryColorDark,
          )),
          Tab(
              icon: Icon(
            Icons.bookmark_outline,
            color: Theme.of(context).primaryColorDark,
          )),
        ],
      ),
    );
  }
}
