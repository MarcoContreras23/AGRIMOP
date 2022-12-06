import 'package:agri_mop/utils/type_alert.dart';

import 'package:flutter/material.dart';
//STATE MANAGEMENT ABOUT FUNCTIONS CALLBACKS AND ANOTHERS
class WaterController {
  late BuildContext _context;
  TextEditingController temp = TextEditingController();
  TextEditingController sze = TextEditingController();

  // ===========================================================================
  static final WaterController _singleton = WaterController._();

  factory WaterController(BuildContext context) =>
      _singleton._instance(context);

  WaterController._();

  WaterController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  // ==========================================================================
//FUNCTION TO CALCULATE WATER
  Future<void> calculateWater({required String value1,value2}) async {
    //jugar con estos valores
    if (temp.text.contains('4')&&
        sze.text.contains('2')) {
    final c1= int.parse(temp.text);
    final c2= int.parse(sze.text);
    final c3= ((c1-c2)/c2)*100;
    print(c3);
      alertSuccess('Cultivo en buen estado de agua');
    } else if(temp.text.contains('3') && sze.text.contains('103')) {
      alertError('¡Cultivo bajo estado de agua');
    }
  }
//ALERTS
  void alertSuccess(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.success);

  void alertError(String msg) =>
      SnackBarFloating.show(_context, msg, type: TypeAlert.error);
}
