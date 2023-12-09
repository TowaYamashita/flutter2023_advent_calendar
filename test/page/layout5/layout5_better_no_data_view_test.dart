import 'package:flutter/material.dart';
import 'package:flutter2023_advent_calendar/page/layout5/layout5_better_no_data_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('「TODOはありません」が表示される', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Layout5BetterNoDataView(),
      ),
    );
    await tester.pump();

    final finder = find.text('TODOはありません');

    expect(
      finder,
      findsOneWidget,
      reason: '「TODOはありません」と表示されること',
    );
  });
}
