
import 'package:agri_mop/fertilizer/fertilizer_view.dart';
import 'package:flutter/material.dart';
//class to show routes about project

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      'fertilizerView': MaterialPageRoute(builder: (_) => const FertilizerView()),
    };

    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
