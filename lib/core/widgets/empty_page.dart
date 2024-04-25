import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:styled_widget/styled_widget.dart';

class EmptyPage extends ConsumerWidget {
  const EmptyPage(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        const SizedBox(height: 10),
        OutlinedButton(
          child: const Text('Explore')
              .textColor(Theme.of(context).primaryColorDark),
          onPressed: () => ref
              .read(currentTabNotifierProvider.notifier)
              .update((state) => TabItem.search),
        ),
      ],
    ));
  }
}
