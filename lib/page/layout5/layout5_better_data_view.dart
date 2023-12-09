import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/model/todos.dart';

class Layout5BetterDataView extends StatelessWidget {
  const Layout5BetterDataView({
    super.key,
    required this.todos,
  });

  final Todos todos;

  static const dataKey = Key('BetterDataViewData');
  static const moreButtonKey = Key('BetterDataViewMoreButton');

  @override
  Widget build(BuildContext context) {
    final data = todos.todos;
    final showMoreButton = todos.total > todos.skip + todos.limit;

    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            final d = data[index];
            return ListTile(
              key: dataKey,
              title: Text(d.todo),
              subtitle: Text('ユーザ: ${d.userId}'),
              enabled: !d.completed,
            );
          },
        ),
        if (showMoreButton)
          SliverToBoxAdapter(
            child: OutlinedButton(
              key: moreButtonKey,
              onPressed: () {},
              child: const Text('もっと見る'),
            ),
          ),
      ],
    );
  }
}
