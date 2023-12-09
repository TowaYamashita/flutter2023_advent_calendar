import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_better_error_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Errorを渡した場合は、「エラーが発生しました」が表示される', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Layout5BetterErrorView(
          error: Error(),
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    await tester.pump();

    final finder = find.text('エラーが発生しました');

    expect(
      finder,
      findsOneWidget,
      reason: '「エラーが発生しました」と表示されること',
    );
  });

  testWidgets('Exceptionを渡した場合は、「エラーが発生しました」が表示される', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Layout5BetterErrorView(
          error: Exception(),
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    await tester.pump();

    final finder = find.text('エラーが発生しました');

    expect(
      finder,
      findsOneWidget,
      reason: '「エラーが発生しました」と表示されること',
    );
  });

  testWidgets('ErrorでもExceptionでもないオブジェクトを渡した場合は、「不明なエラーが発生しました」が表示される',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Layout5BetterErrorView(
          error: Object(),
          stackTrace: StackTrace.empty,
        ),
      ),
    );
    await tester.pump();

    final finder = find.text('不明なエラーが発生しました');

    expect(
      finder,
      findsOneWidget,
      reason: '「不明なエラーが発生しました」と表示されること',
    );
  });
}
