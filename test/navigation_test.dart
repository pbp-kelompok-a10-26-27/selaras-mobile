import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:selaras_mobile/core/network/api_check.dart';
import 'package:selaras_mobile/main.dart';

/// Drawer label -> the page title it opens.
const modules = {
  'My Account': 'My Account',
  'Articles & Education': 'Articles & Education',
  'Green Challenges': 'Green Challenges',
  'Community Feed': 'Community Feed',
  'Green Donations': 'Green Donations',
  'Help Desk': 'Help Desk',
  'Notifications': 'Notifications',
  'Admin Dashboard': 'Admin Dashboard',
};

Finder get _appBarTitle =>
    find.descendant(of: find.byType(AppBar), matching: find.byType(Text));

Future<void> _openDrawer(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Open navigation menu'));
  await tester.pumpAndSettle();
}

/// The Android back button / gesture. Module pages show the drawer's hamburger
/// in the app bar (Material shows it instead of a back arrow), so this is how
/// a user steps back to Home.
Future<void> _systemBack(WidgetTester tester) async {
  await tester.binding.handlePopRoute();
  await tester.pumpAndSettle();
}

Future<void> _pumpApp(WidgetTester tester) async {
  // Tall surface so every drawer entry is visible without scrolling
  tester.view.physicalSize = const Size(800, 2000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const SelarasApp());
}

void main() {
  setUp(() {
    ApiCheck.clientFactory = () => MockClient(
      (_) async => http.Response(
        '{"detail":"Authentication credentials were not provided."}',
        401,
        headers: {'content-type': 'application/json'},
      ),
    );
  });

  tearDown(() => ApiCheck.clientFactory = http.Client.new);

  testWidgets('every module page opens from the drawer', (tester) async {
    await _pumpApp(tester);

    for (final entry in modules.entries) {
      await _openDrawer(tester);
      await tester.tap(find.text(entry.key));
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text(entry.value),
        ),
        findsOneWidget,
        reason: '${entry.key} page should be open',
      );
      expect(find.text('API checkpoint'), findsOneWidget);
    }
  });

  testWidgets('every module page opens from the home grid', (tester) async {
    await _pumpApp(tester);
    // Grid labels differ slightly from the page titles
    const cards = {
      'Account': 'My Account',
      'Articles': 'Articles & Education',
      'Challenges': 'Green Challenges',
      'Feed': 'Community Feed',
      'Donations': 'Green Donations',
      'Help Desk': 'Help Desk',
      'Notifications': 'Notifications',
      'Dashboard': 'Admin Dashboard',
    };

    for (final card in cards.entries) {
      await tester.tap(find.text(card.key).first);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text(card.value),
        ),
        findsOneWidget,
        reason: '${card.key} card should open ${card.value}',
      );

      // Back to Home for the next card
      await _systemBack(tester);
      expect(find.text('Welcome to SELARAS Mobile'), findsOneWidget);
    }
  });

  testWidgets('drawer hops between modules without stacking pages', (
    tester,
  ) async {
    await _pumpApp(tester);

    await _openDrawer(tester);
    await tester.tap(find.text('Articles & Education'));
    await tester.pumpAndSettle();

    await _openDrawer(tester);
    await tester.tap(find.text('Help Desk'));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.text('Help Desk'),
      ),
      findsOneWidget,
    );

    // One back press returns to Home, not to Articles
    await _systemBack(tester);
    expect(find.text('Welcome to SELARAS Mobile'), findsOneWidget);
  });

  testWidgets('drawer Home returns to the home page', (tester) async {
    await _pumpApp(tester);

    await _openDrawer(tester);
    await tester.tap(find.text('Green Challenges'));
    await tester.pumpAndSettle();

    await _openDrawer(tester);
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome to SELARAS Mobile'), findsOneWidget);
  });

  testWidgets('tapping the current page in the drawer just closes it', (
    tester,
  ) async {
    await _pumpApp(tester);

    await _openDrawer(tester);
    await tester.tap(find.text('Community Feed'));
    await tester.pumpAndSettle();

    await _openDrawer(tester);
    await tester.tap(
      find.descendant(
        of: find.byType(Drawer),
        matching: find.text('Community Feed'),
      ),
    );
    await tester.pumpAndSettle();

    expect(_appBarTitle, findsOneWidget);
    await _systemBack(tester);
    expect(find.text('Welcome to SELARAS Mobile'), findsOneWidget);
  });

  testWidgets('a module page shows the endpoint check result', (tester) async {
    await _pumpApp(tester);

    await _openDrawer(tester);
    await tester.tap(find.text('My Account'));
    await tester.pumpAndSettle();

    expect(find.textContaining('/api/v1/accounts/me/'), findsOneWidget);
    expect(find.textContaining('DRF is reachable'), findsOneWidget);
  });
}
