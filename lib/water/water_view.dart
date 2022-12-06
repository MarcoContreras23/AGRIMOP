import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';

import 'water_controller.dart';
import 'widget/line_chart.dart';
//VIEW ABOUT  WATER ANG GRAHPS
class WaterView extends StatefulWidget {
  const WaterView({Key? key}) : super(key: key);

  @override
  State<WaterView> createState() => _WaterViewState();
}

class _WaterViewState extends State<WaterView> {
  late WaterController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = WaterController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Grafico'),
      appBar: AppBar(
        title: const Text("Water"),
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
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [Text("ETo = 5 mm"), Text("ETo = 7 mm")],
  );
}

Widget _valuesTwo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [Text("Kc = 1.3  "), Text("Kc = 1.8")],
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

Widget _buttons(BuildContext cxt, WaterController contrll) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          onPressed: () => contrll.calculateWater(
              value1: contrll.temp.text = "4",
              value2: contrll.sze.text = "102"),
          child: const Text("Calcular")),
      const SizedBox(width: 10),
      ElevatedButton(
          onPressed: () => useNavigatePop(cxt), child: const Text("Volver"))
    ],
  );
}
