import 'package:car_renting/login.dart';
import 'package:car_renting/reurning_form.dart';
import 'package:car_renting/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:car_renting/widgets/cars_grid.dart';

class CarsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Car Renting', style: SubHeading),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout),
            )
          ]),
      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.all(8.0)),
          SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReturnFormPage()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  side: BorderSide(color: Colors.blue, width: 1)),
              textColor: Colors.white,
              child: Text("Return Car"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cars',
              style: MainHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarsGrid(),
          )
        ],
      ),
    );
  }
}
