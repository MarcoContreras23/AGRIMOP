import 'package:agri_mop/fertilizer/fertilizer_view.dart';
import 'package:agri_mop/temperature/temperature_view.dart';
import 'package:agri_mop/water/water_view.dart';
import 'package:flutter/material.dart';

import '../humidity/humidity_view.dart';
//class to show routes about project

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      'fertilizerView': MaterialPageRoute(builder: (_) => const FertilizerView()),
      'humidityView':MaterialPageRoute(builder: (_)=> const HumidityView() ),
      'temperatureView':MaterialPageRoute(builder: (_)=> const TemperatureView() ),
      'waterView':MaterialPageRoute(builder: (_)=> const WaterView() ),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
