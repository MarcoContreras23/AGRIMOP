import 'package:flutter/material.dart';

Future<dynamic> useNavigatePushName(
  BuildContext context,
  String route, {
  Object? arguments,
}) async {
  await Navigator.of(context).pushNamed(route, arguments: arguments);
}

void useNavigatePop(BuildContext context) async {
  Navigator.of(context).pop();
}

Future<dynamic> useNavigateReplaceName(
  BuildContext context,
  String route, {
  Object? arguments,
}) async {
  await Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}

Future<dynamic> useNavigateReplacePage(
  BuildContext context,
  String route,
) async {
  Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
}
