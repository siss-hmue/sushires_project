import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import '../severs/database.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  State<ReservationForm> createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();

  DateTime _selectedDate =
      DateTime.now(); // can get current date in the _selectedDate
  //user can select specific date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2024, 12, 31));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  TimeOfDay _selectedTime = TimeOfDay.now();
  //users can select specific time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Table',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Reservation',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Contact Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.alarm,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onTap: () {
                              _selectTime(context);
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            _selectedTime.format(context),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    String Id = randomAlphaNumeric(10);
                    Map<String, dynamic> customerInfoMap = {
                      "Name": namecontroller.text,
                      "Phone": phonecontroller.text,
                      "Id": Id,
                      "Date":
                          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'
                              .toString(),
                      "Time": _selectedTime.format(context).toString(),
                    };
                    await DatabaseMethods()
                        .addCustomerReservation(customerInfoMap, Id)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg:
                              "Customer reservation has been uploaded successfully.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'SAVE RESERVATION',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
