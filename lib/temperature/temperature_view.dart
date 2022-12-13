import 'dart:math';

import 'package:agri_mop/temperature/temperature_controller.dart';
import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';

import 'widget/line_chart.dart';

//VIEW ABOUT  TEMPERATURE ANG GRAHPS
class TemperatureView extends StatefulWidget {
  const TemperatureView({Key? key}) : super(key: key);

  @override
  State<TemperatureView> createState() => _TemperatureViewState();
}

class _TemperatureViewState extends State<TemperatureView> {
  late TemperatureController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TemperatureController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Grafico'),
      appBar: AppBar(
        title: const Text("Temperature"),
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
          const SizedBox(width: 10),
          _valuesTree(),
          _buttons(context, controller)
        ],
      ),
    );
  }
}

Widget _values() {
  var intValue = Random().nextInt(37);
  String stringValue = intValue.toString();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [Text("X = $stringValue °C"), const Text("XY = 25°C")],
  );
}

Widget _valuesTwo() {
  var intValue = Random().nextInt(37);
  String stringValue = intValue.toString();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [Text("Y = $stringValue °C"), const Text("ZZ = 24.7°C")],
  );
}

Widget _valuesTree() {
  var intValue = Random().nextInt(37);
  String stringValue = intValue.toString();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [Text("Z = $stringValue °C"), const Text("ZZ = 23°C")],
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

Widget _buttons(BuildContext cxt, TemperatureController contrll) {
  var intValue = Random().nextInt(37);
  String stringValue = intValue.toString();
  var secondValue = Random().nextInt(37);
  String stringSecondValue = secondValue.toString();

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          onPressed: () => contrll.calculateTemperature(
              value1: contrll.temp.text = stringValue,
              value2: contrll.sze.text = stringSecondValue),
          child: const Text("Calcular")),
      const SizedBox(width: 10),
      ElevatedButton(
          onPressed: () => useNavigatePop(cxt), child: const Text("Volver"))
    ],
  );
}
