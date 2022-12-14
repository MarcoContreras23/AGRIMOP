import 'package:agri_mop/pages/home_page.dart';
import 'package:agri_mop/routes/router_generator.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    const Color p = Color(0xff416d69);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriMOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: p,
      ),
      initialRoute: 'dash',
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}