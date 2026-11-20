import 'package:flutter_test/flutter_test.dart';
import 'package:selaras_mobile/main.dart';

void main() {
  testWidgets('SelarasApp smoke test and baseline render', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SelarasApp());

    // Verify that the title SELARAS is present.
    expect(find.text('SELARAS'), findsWidgets);
    expect(find.text('Welcome to SELARAS Mobile'), findsOneWidget);
  });
}
