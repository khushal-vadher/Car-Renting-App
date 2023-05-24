import 'package:flutter/material.dart';
import 'screens/cars_overview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Renting',
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.purple),
      home: CarsOverviewScreen(),
    );
  }
}
