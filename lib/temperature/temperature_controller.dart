import 'package:agri_mop/utils/type_alert.dart';

import 'package:flutter/material.dart';

//STATE MANAGEMENT ABOUT FUNCTIONS CALLBACKS AND ANOTHERS
class TemperatureController {
  late BuildContext _context;
  TextEditingController temp = TextEditingController();
  TextEditingController sze = TextEditingController();

  // ===========================================================================
  static final TemperatureController _singleton = TemperatureController._();

  factory TemperatureController(BuildContext context) =>
      _singleton._instance(context);

  TemperatureController._();

  TemperatureController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  // ==========================================================================
//FUNCTION TO CALCULATE TEMPERATURE
  Future<void> calculateTemperature({required String value1, value2}) async {
    var valueSensor = int.parse(value1);
    var valueIdeal = int.parse(value2);
    if (valueSensor > valueIdeal) {
      alertSuccess('Nivel de temperatura ideal');
    } else if (valueSensor < valueIdeal) {
      alertError('¡Cultivo demasiado calido!');
    }
  }

//ALERTS
  void alertSuccess(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.success);

  void alertError(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.error);
}
