import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_page.dart';
import 'package:flutter2023_advent_calendar/repository/todos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/todo.dart';
import '../../mock/todos.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  final mockTodosRepository = MockTodosRepository();
  testWidgets('ローディング中の場合は、ローディング表示になる', (WidgetTester tester) async {
    when(() => mockTodosRepository.fetch()).thenAnswer(
      (_) async => mockTodos,
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todosRepositoryProvider.overrideWithValue(mockTodosRepository)
        ],
        child: const MaterialApp(
          home: Layout5Page(title: ''),
        ),
      ),
    );

    final finder = find.byKey(Layout5Page.loadingViewKey);

    expect(
      finder,
      findsOneWidget,
      reason: 'ローディング表示になること',
    );
  });

  testWidgets('データの取得に失敗した場合は、エラー表示になる', (WidgetTester tester) async {
    when(() => mockTodosRepository.fetch()).thenThrow(Error());
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todosRepositoryProvider.overrideWithValue(mockTodosRepository)
        ],
        child: const MaterialApp(
          home: Layout5Page(title: ''),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final finder = find.byKey(Layout5Page.errorViewKey);

    expect(
      finder,
      findsOneWidget,
      reason: 'エラー表示になること',
    );
  });

  testWidgets('データの取得に成功したが中身が空の場合は、ノーデータ表示になる', (WidgetTester tester) async {
    when(() => mockTodosRepository.fetch()).thenAnswer(
      (_) async => mockTodos.copyWith(
        todos: [],
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todosRepositoryProvider.overrideWithValue(mockTodosRepository)
        ],
        child: const MaterialApp(
          home: Layout5Page(title: ''),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final finder = find.byKey(Layout5Page.noDataViewKey);

    expect(
      finder,
      findsOneWidget,
      reason: 'ノーデータ表示になること',
    );
  });

  testWidgets('データの取得に成功した場合は、データ表示になる', (WidgetTester tester) async {
    when(() => mockTodosRepository.fetch()).thenAnswer(
      (_) async => mockTodos.copyWith(
        todos: [mockTodo],
      ),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          todosRepositoryProvider.overrideWithValue(mockTodosRepository)
        ],
        child: const MaterialApp(
          home: Layout5Page(title: ''),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final finder = find.byKey(Layout5Page.dataViewKey);

    expect(
      finder,
      findsOneWidget,
      reason: 'データ表示になること',
    );
  });
}
