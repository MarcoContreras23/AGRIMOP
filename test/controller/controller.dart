import 'package:agri_mop/fertilizer/fertilizer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
class MockFertilizerController extends Mock implements FertilizerController {}

void main() {

  final MockFertilizerController mockFertilizerController = MockFertilizerController();

    testWidgets(
      'Test from method to calculate fertilizer ,temperature and others  ',(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Material(child: Container()))));
    final BuildContext context = tester.element(find.byType(Container));
    FertilizerController controller = FertilizerController(context);
    controller.calculateFertilizer(value1: "2", value2: "3").then((value) => controller.alertError('¡Cultivo bajo en fertilizante!'));

    expect(controller.calculateFertilizer(value1: "2",value2: "3"), isNotNull);
  });
}