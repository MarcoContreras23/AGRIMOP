import 'package:agri_mop/utils/type_alert.dart';

import 'package:flutter/material.dart';

//STATE MANAGEMENT ABOUT FUNCTIONS CALLBACKS AND ANOTHERS
class FertilizerController {
  late BuildContext _context;
  TextEditingController temp = TextEditingController();
  TextEditingController sze = TextEditingController();

  // ===========================================================================
  static final FertilizerController _singleton = FertilizerController._();

  factory FertilizerController(BuildContext context) =>
      _singleton._instance(context);

  FertilizerController._();

  FertilizerController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  // ==========================================================================
//FUNCTION TO CALCULATE FERTILIZER
  Future<void> calculateFertilizer({required String value1, value2}) async {
    var valueSensor = int.parse(value1);
    var valueIdeal = int.parse(value2);
    if (valueSensor > valueIdeal) {
      alertSuccess('Cultivo con buen fertilizante');
    } else if (valueSensor < valueIdeal) {
      alertError('¡Cultivo bajo en fertilizante!');
    }
  }

//ALERTS
  void alertSuccess(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.success);

  void alertError(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.error);
}
