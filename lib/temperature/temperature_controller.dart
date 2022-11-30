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
  Future<void> calculateTemperature({required String value1,value2}) async {
    
    if (temp.text.contains('4')&&
        sze.text.contains('2')) {
    final c1= int.parse(temp.text);
    final c2= int.parse(sze.text);
    final c3= ((c1-c2)/c2)*100;
      alertSuccess('Nivel de temperatura ideal');
    } else if(temp.text.contains('3') && sze.text.contains('103')) {
      alertError('¡Cultivo demasiado calido!');
    }
  }
//ALERTS
  void alertSuccess(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.success);

  void alertError(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.error);
}
