import 'dart:math';

import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';

import 'humidity_controller.dart';
import 'widget/line_chart.dart';

//VIEW ABOUT  FERTILIZER ANG GRAHPS
class HumidityView extends StatefulWidget {
  const HumidityView({Key? key}) : super(key: key);

  @override
  State<HumidityView> createState() => _FertilizerViewState();
}

class _FertilizerViewState extends State<HumidityView> {
  late HumidityController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = HumidityController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Grafico'),
      appBar: AppBar(
        title: const Text("Humedad"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SimpleLineChart.withSampleData(),
          ),
          _texts(),
          _values(),
          const SizedBox(width: 10),
          _valuesTwo(),
          _buttons(context, controller)
        ],
      ),
    );
  }
}

Widget _values() {
  var intValue = Random().nextInt(100);
  String stringValue = intValue.toString();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [Text("X = $stringValue"), const Text("XY = 50")],
  );
}

Widget _valuesTwo() {
  var intValue = Random().nextInt(100);
  String stringValue = intValue.toString();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [Text("Y = $stringValue "), const Text("ZZ = 50")],
  );
}

Widget _texts() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [
      Text("Sensor"),
      Text("Ideal"),
    ],
  );
}

Widget _buttons(BuildContext cxt, HumidityController contrll) {
  var intValue = Random().nextInt(100);
  String stringValue = intValue.toString();
  var secondValue = Random().nextInt(20);
  String stringSecondValue = secondValue.toString();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          onPressed: () => contrll.calculateHumidity(
              value1: contrll.temp.text = stringValue,
              value2: contrll.sze.text = stringSecondValue),
          child: const Text("Calcular")),
      const SizedBox(width: 10),
      ElevatedButton(
          onPressed: () => useNavigatePop(cxt), child: const Text("Volver"))
    ],
  );
}
