import 'package:car_renting/home.dart';
import 'package:car_renting/login.dart';
import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  final String name;
  final int milage1, milage2, price;

  const Bill(
      {Key? key,
      required this.name,
      required this.milage1,
      required this.milage2,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Car Renting'),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent[600],
        ),
        body: Center(
          child: Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    top: 150, bottom: 10, left: 10, right: 10),
                child: Column(
                  children: [
                    Text(
                      'Customer Name:  ${name}',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                    Text(
                      '--------------------------------------',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                    Text(
                      'Starting Milage :  ${milage1}',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                    Text(
                      'Ending Milage :  ${milage2}',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                    Text(
                      'Price per KM in INR:  ${price}',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                    Text(
                      '--------------------------------------',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                    Text(
                      'Total Rent in INR:  ${(milage2 - milage1) * price}',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[600],
                          fontFamily: 'Aboreto'),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 10, right: 10),
              child: Text(
                'Hope You Enjoy Your Ride!!',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.grey[600],
                    fontFamily: 'Aboreto'),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.blue, width: 2)),
                textColor: Colors.white,
                child: Text("Login"),
              ),
            )
          ]),
        ));
  }
}
