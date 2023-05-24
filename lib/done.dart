import 'package:car_renting/home.dart';
import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

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
                  top: 250, bottom: 100, left: 10, right: 10),
              child: Text(
                'Your Car has been Successfully Booked',
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
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.blue, width: 2)),
                textColor: Colors.white,
                child: Text("Home"),
              ),
            )
          ]),
        ));
  }
}
