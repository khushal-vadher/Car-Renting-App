import 'package:car_renting/bill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'InputDeco_design.dart';

import 'package:car_renting/utils/utils.dart';


class MilageFormPage extends StatefulWidget {
  MilageFormPage({Key? key}) : super(key: key);

  @override
  _MilageFormPageState createState() => _MilageFormPageState();
}

class _MilageFormPageState extends State<MilageFormPage> {
  String email = '';

  TextEditingController nameController = new TextEditingController();
  TextEditingController milage1Controller = new TextEditingController();
  TextEditingController milage2Controller = new TextEditingController();
  TextEditingController priceController = new TextEditingController();

  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Rent', style: SubHeading),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Full Name"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: milage1Controller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                    decoration: buildInputDecoration(Icons.numbers, "Milage1"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: milage2Controller,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.numbers, "Milage2"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.money, "Price"),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      final user = User(
                        full_name: nameController.text,
                        milage1: int.parse(milage1Controller.text),
                        milage2: int.parse(milage2Controller.text),
                        price: int.parse(priceController.text),
                      );
                      createUser(user);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bill(
                                  name: nameController.text,
                                  milage1: int.parse(milage1Controller.text),
                                  milage2: int.parse(milage2Controller.text),
                                  price: int.parse(priceController.text))));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('Milage').doc();

    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String full_name;
  final int milage2;
  final int milage1;
  final int price;

  User(
      {this.id = '',
      required this.full_name,
      required this.price,
      required this.milage1,
      required this.milage2});

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': full_name,
        'price': price,
        'milage1': milage1,
        'milage2': milage2
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      full_name: json['full_name'],
      price: json['car_name'],
      milage1: json['email'],
      milage2: json['phone_no']);
}
