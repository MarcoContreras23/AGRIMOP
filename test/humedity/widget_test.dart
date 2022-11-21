import 'package:agri_mop/humidity/humidity_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Test Humedity', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HumidityView()));
    // Verify the Key
    expect(find.byKey(const Key('Grafico')), findsOneWidget);
  });


}