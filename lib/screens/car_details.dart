import 'package:car_renting/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/specific_card.dart';
import 'package:car_renting/booking_form.dart';

class CarDetail extends StatelessWidget {
  final String title;
  final double price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;

  CarDetail(
      {required this.title,
      required this.price,
      required this.color,
      required this.gearbox,
      required this.fuel,
      required this.brand,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(title, style: MainHeading),
            Text(
              brand,
              style: BasicHeading,
            ),
            Hero(tag: title, child: Image.asset(path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SpecificsCard(
                  name: '100 KM',
                  price: price * 100,
                  name2: 'INR',
                ),
                SpecificsCard(
                  name: '50 KM',
                  price: price * 50,
                  name2: 'INR',
                ),
                SpecificsCard(
                  name: '1 KM',
                  price: price * 1,
                  name2: 'INR',
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              'SPECIFICATIONS',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SpecificsCard(
                  name: 'Color',
                  name2: color,
                  price: 0,
                ),
                SpecificsCard(
                  name: 'Gearbox',
                  name2: gearbox,
                  price: 0,
                ),
                SpecificsCard(
                  name: 'Fuel',
                  name2: fuel,
                  price: 0,
                )
              ],
            ),
            SizedBox(height: 10),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => FormPage(carname: title)));
              },
              child: Text(
                'Book Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Text(
              "   *  Not Availability of This Car is  Shown Below with date, If you Select That date than not Considerable by company.",
              style: TextStyle(color: Colors.red),
            ),
            Text(
              "If not Show Anything Than it's Available For any Date",
              style: TextStyle(color: Colors.red),
            ),
            StreamBuilder<List<User>>(
                stream: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Somethong went Wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final customer = snapshot.data!;
                    return ListView(
                      shrinkWrap: true,
                      children: customer.map(buildUser).toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget buildUser(User user) => ListTile(
          subtitle: Container(
        child: title == user.car_name
            ? Column(
                children: [
                  Text(title + " Not Available",
                      style: TextStyle(color: Colors.red)),
                  Text(user.jour_start.toIso8601String()),
                  Text("to"),
                  Text(user.jour_end.toIso8601String())
                ],
              )
            : Container(),
      ));

  Stream<List<User>> readUser() => FirebaseFirestore.instance
      .collection('customer')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

class User {
  String id;
  final String full_name;
  final String car_name;
  final String email;
  final int phone_no;
  final int licence_no;
  final DateTime DOB;
  final DateTime jour_start;
  final DateTime jour_end;

  User(
      {this.id = '',
      required this.full_name,
      required this.car_name,
      required this.licence_no,
      required this.email,
      required this.DOB,
      required this.jour_start,
      required this.jour_end,
      required this.phone_no});

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': full_name,
        'car_name': car_name,
        'email': email,
        'DOB': DOB,
        'jour_end': jour_end,
        'jour_start': jour_start,
        'licence_no': licence_no,
        'phone_no': phone_no
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      full_name: json['full_name'],
      car_name: json['car_name'],
      email: json['email'],
      DOB: (json['DOB'] as Timestamp).toDate(),
      jour_end: (json['jour_end'] as Timestamp).toDate(),
      jour_start: (json['jour_start'] as Timestamp).toDate(),
      licence_no: json['licence_no'],
      phone_no: json['phone_no']);
}
