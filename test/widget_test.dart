import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:selaras_mobile/core/network/api_check.dart';
import 'package:selaras_mobile/main.dart';

void main() {
  setUp(() {
    // Never hit the network from widget tests
    ApiCheck.clientFactory = () => MockClient(
      (_) async => http.Response(
        '{"detail":"Authentication credentials were not provided."}',
        401,
        headers: {'content-type': 'application/json'},
      ),
    );
  });

  tearDown(() => ApiCheck.clientFactory = http.Client.new);

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
