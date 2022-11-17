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
//FUNCTION TO CALCULATE HUMIDITY
  Future<void> calculateHumidity({required String value1,value2}) async {
    //jugar con estos valores
    if (temp.text.contains('4')&&
        sze.text.contains('2')) {
    final c1= int.parse(temp.text);
    final c2= int.parse(sze.text);
    final c3= ((c1-c2)/c2)*100;
    print(c3);
      alertSuccess('Nivel de humedad ideal');
    } else if(temp.text.contains('3') && sze.text.contains('103')) {
      alertError('¡Cultivo Demasiado Seco!');
    }
  }
//ALERTS
  void alertSuccess(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.success);

  void alertError(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.error);
}
