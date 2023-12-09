import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/model/todos.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_better_data_view.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_better_error_view.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_better_no_data_view.dart';
import 'package:flutter2023_advent_calendar/repository/todos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todosProvider = FutureProvider<Todos>((ref) async {
  final repository = ref.read(todosRepositoryProvider);
  return await repository.fetch();
});

class Layout5Page extends StatelessWidget {
  const Layout5Page({
    super.key,
    required this.title,
  });

  final String title;

  static const loadingViewKey = Key('Layout5PageBetterLoadingView');
  static const errorViewKey = Key('Layout5PageBetterErrorView');
  static const noDataViewKey = Key('Layout5PageBetterNoDataView');
  static const dataViewKey = Key('Layout5PageBetterDataView');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: _Better(),
      ),
    );
  }
}

class _Better extends ConsumerWidget {
  const _Better();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(todosProvider).when(
      loading: () {
        return const Center(
          key: Layout5Page.loadingViewKey,
          child: CircularProgressIndicator.adaptive(),
        );
      },
      error: (error, stack) {
        return Center(
          child: Layout5BetterErrorView(
            key: Layout5Page.errorViewKey,
            error: error,
            stackTrace: stack,
          ),
        );
      },
      data: (d) {
        if (d.todos.isEmpty) {
          return const Layout5BetterNoDataView(
            key: Layout5Page.noDataViewKey,
          );
        }

        return Layout5BetterDataView(
          key: Layout5Page.dataViewKey,
          todos: d,
        );
      },
    );
  }
}
