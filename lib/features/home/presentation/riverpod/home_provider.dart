import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// Notifier that holds the current tab.
@riverpod
class CurrentTabNotifier extends _$CurrentTabNotifier {
  /// Constructor for default state.
  @override
  TabItem build() => TabItem.feed;

  /// Function to update the state.
  @override
  set state(TabItem newState) => super.state = newState;
  TabItem update(TabItem Function(TabItem state) cb) => state = cb(state);
}
