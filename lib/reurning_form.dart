import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'InputDeco_design.dart';

import 'package:car_renting/utils/utils.dart';

import 'home.dart';

class ReturnFormPage extends StatefulWidget {
  ReturnFormPage({Key? key}) : super(key: key);

  @override
  _ReturnFormPageState createState() => _ReturnFormPageState();
}

class _ReturnFormPageState extends State<ReturnFormPage> {
  String email = '';

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController carNameController = new TextEditingController();

  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Return Form', style: SubHeading),
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
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Email cannot be empty";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                    decoration: buildInputDecoration(
                        Icons.email, "Email(as per booking form)"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.phone, "Phone No"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: carNameController,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.car_rental, "Car Name"),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      final user = User(
                        full_name: nameController.text,
                        email: emailController.text,
                        phone_no: int.parse(mobileController.text),
                        car_name: carNameController.text,
                      );
                      createUser(user);
                      email = emailController.text;
                      readUser(email);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                ),
                StreamBuilder<List<User>>(
                    stream: readUser(email),
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
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stream<List<User>> readUser(String email) => FirebaseFirestore.instance
      .collection('customer')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Widget buildUser(User user) {
    if (user.email == email) {
      deleteUser(user.id);
    }
    return Container();
  }

  Future createUser(User user) async {
    final docUser =
        FirebaseFirestore.instance.collection('return_customer').doc();

    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }

  Future deleteUser(id) async {
    final docUser =
        FirebaseFirestore.instance.collection('customer').doc(id).delete();
  }
}

class User {
  String id;
  final String full_name;
  final String car_name;
  final String email;
  final int phone_no;

  User(
      {this.id = '',
      required this.full_name,
      required this.car_name,
      required this.email,
      required this.phone_no});

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': full_name,
        'car_name': car_name,
        'email': email,
        'phone_no': phone_no
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      full_name: json['full_name'],
      car_name: json['car_name'],
      email: json['email'],
      phone_no: json['phone_no']);
}
