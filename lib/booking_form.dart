import 'package:car_renting/done.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'InputDeco_design.dart';
import 'package:intl/intl.dart';
import 'package:car_renting/utils/utils.dart';

class FormPage extends StatefulWidget {
  final String carname;

  FormPage({Key? key, required this.carname}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState(carname);
}

class _FormPageState extends State<FormPage> {
  String carname;

  _FormPageState(this.carname);

  final dateInput2 = TextEditingController();
  final dateInput1 = TextEditingController();
  final dateInput = TextEditingController();

  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final mobileController = new TextEditingController();
  final carNameController = new TextEditingController();
  final licenceController = new TextEditingController();

  @override
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Booking Form', style: SubHeading),
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
                  child: Text(
                    carname,
                    style: MainHeading,
                  ),
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
                    decoration: buildInputDecoration(Icons.email, "Email"),
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
                    controller: dateInput,
                    decoration:
                        buildInputDecoration(Icons.calendar_today, "DOB"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: licenceController,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.numbers, "Licence No."),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: dateInput1,
                    decoration: buildInputDecoration(
                        Icons.calendar_today, "Journey Start"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate1 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      if (pickedDate1 != null) {
                        print(
                            pickedDate1); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate1 =
                            DateFormat('yyyy-MM-dd').format(pickedDate1);
                        print(
                            formattedDate1); //formatted  date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput1.text =
                              formattedDate1; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: dateInput2,
                    decoration: buildInputDecoration(
                        Icons.calendar_today, "Journey End"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate2 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100));
                      if (pickedDate2 != null) {
                        print(
                            pickedDate2); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate2 =
                            DateFormat('yyyy-MM-dd').format(pickedDate2);
                        print(
                            formattedDate2); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput2.text =
                              formattedDate2; //set output date to TextField value.
                        });
                      } else {}
                    },
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
                          jour_end: DateTime.parse(dateInput2.text),
                          jour_start: DateTime.parse(dateInput1.text),
                          DOB: DateTime.parse(dateInput.text),
                          email: emailController.text,
                          phone_no: int.parse(mobileController.text),
                          car_name: carname,
                          licence_no: int.parse(licenceController.text));
                      createUser(user);
                      createUser1(user);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Done()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('customer').doc();

    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }

  Future createUser1(User user) async {
    final docUser = FirebaseFirestore.instance.collection('all_booking').doc();

    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
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
}
