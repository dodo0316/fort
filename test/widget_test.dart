import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fortune/main.dart';

void main() {
  testWidgets('Fortune Teller App Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our initial fortune result is empty.
    expect(find.text('생년월일을 입력하세요:'), findsOneWidget);

    // Enter a date and tap '운세 보기'.
    await tester.enterText(find.byType(TextField), '1990-01-01');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the fortune result is updated.
    expect(find.text('생년월일을 입력하세요:'), findsNothing);
    expect(find.text('운세 결과:'), findsOneWidget);
  });
}
