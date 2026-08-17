import 'package:flutter_test/flutter_test.dart';
import 'package:skillpath_flutter/main.dart';

void main() {
  testWidgets('SkillPath app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const SkillPathApp());

    expect(find.text('SkillPath'), findsWidgets);
  });
}
