import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_app/main.dart';

void main() {
  testWidgets('App mounts without errors', (WidgetTester tester) async {
    // Build the TodoApp and trigger a frame.
    await tester.pumpWidget(const TodoApp());
    await tester.pump(); // settle initial build

    // The app should display a loading state or empty state — not crash.
    expect(find.byType(TodoApp), findsOneWidget);
  });
}
