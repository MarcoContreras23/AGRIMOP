import 'package:agri_mop/fertilizer/fertilizer_controller.dart';
import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';

import 'widget/line_chart.dart';

class FertilizerView extends StatefulWidget {
  const FertilizerView({Key? key}) : super(key: key);

  @override
  State<FertilizerView> createState() => _FertilizerViewState();
}

class _FertilizerViewState extends State<FertilizerView> {
  late FertilizerController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = FertilizerController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('Grafico'),
      appBar: AppBar(
        title: const Text("Fertilizante"),
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
    children: const [Text("X =200 "), Text("XY =23.29")],
  );
}

Widget _valuesTwo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: const [Text("Y =200 "), Text("ZZ =23.29")],
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

Widget _buttons(BuildContext cxt, FertilizerController contrll) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          onPressed: () => contrll.calculateHumidity(
              value1: contrll.temp.text = "3",
              value2: contrll.sze.text = "103"),
          child: const Text("Calcular")),
      const SizedBox(width: 10),
      ElevatedButton(
          onPressed: () => useNavigatePop(cxt), child: const Text("Volver"))
    ],
  );
}
