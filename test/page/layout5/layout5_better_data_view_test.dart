import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_better_data_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/todo.dart';
import '../../mock/todos.dart';

void main() {
  testWidgets('TODOのリストが表示される', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Layout5BetterDataView(
            todos: mockTodos.copyWith(
              todos: [mockTodo],
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final finder = find.byKey(Layout5BetterDataView.dataKey);

    expect(
      finder,
      findsOneWidget,
      reason: 'TODOのリストが表示されること',
    );
  });

  testWidgets('読み込めるTODOリストがある場合は、もっと見るボタンが表示される', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Layout5BetterDataView(
            todos: mockTodos.copyWith(
              todos: [mockTodo],
              total: 150,
              skip: 0,
              limit: 30,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final finder = find.byKey(Layout5BetterDataView.moreButtonKey);

    expect(
      finder,
      findsOneWidget,
      reason: 'もっと見るボタンが表示されること',
    );
  });

  testWidgets('読み込めるTODOリストがない場合は、もっと見るボタンが表示されない', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Layout5BetterDataView(
            todos: mockTodos.copyWith(
              todos: [mockTodo],
              total: 150,
              skip: 120,
              limit: 30,
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final finder = find.byKey(Layout5BetterDataView.moreButtonKey);

    expect(
      finder,
      findsNothing,
      reason: 'もっと見るボタンが表示されないこと',
    );
  });
}
