
import 'package:agri_mop/fertilizer/fertilizer_view.dart';
import 'package:flutter/material.dart';

import '../humidity/humidity_view.dart';
//class to show routes about project

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      'fertilizerView': MaterialPageRoute(builder: (_) => const FertilizerView()),
      'humidityView':MaterialPageRoute(builder: (_)=> const HumidityView() )
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
