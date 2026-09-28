import 'package:flutter_test/flutter_test.dart';
import 'package:app3/main.dart';

void main() {
  testWidgets('CoinOrbit renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const CoinOrbitApp());
    expect(find.byType(CoinOrbitApp), findsOneWidget);
  });
}
