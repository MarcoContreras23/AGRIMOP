import 'package:agri_mop/utils/type_alert.dart';

import 'package:flutter/material.dart';

//STATE MANAGEMENT ABOUT FUNCTIONS CALLBACKS AND ANOTHERS
class HumidityController {
  late BuildContext _context;
  TextEditingController temp = TextEditingController();
  TextEditingController sze = TextEditingController();

  // ===========================================================================
  static final HumidityController _singleton = HumidityController._();

  factory HumidityController(BuildContext context) =>
      _singleton._instance(context);

  HumidityController._();

  HumidityController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  // ==========================================================================
//FUNCTION TO CALCULATE HUMIDITY
  Future<void> calculateHumidity({required String value1, value2}) async {
    var valueSensor = int.parse(value1);
    var valueIdeal = int.parse(value2);
    if (valueSensor > valueIdeal) {
      alertSuccess('Nivel de humedad ideal');
    } else if (valueSensor < valueIdeal) {
      alertError('¡Cultivo Demasiado Seco!');
    }
  }

//ALERTS
  void alertSuccess(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.success);

  void alertError(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.error);
}
