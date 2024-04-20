import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sushires_project/screens/reservation_form.dart';

import '../severs/database.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  //to edit the detilas, we need them again here
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

//Read the data from the firestore database
  Stream? CustomerStream;
//as soon as we open the app, the app will quickly collect all the details from the respective Customer Collections
  getontheload() async {
    CustomerStream = await DatabaseMethods().getCustomerDetails();
    // will use setState method so that we can quickly pass data to the list view builder
    setState(() {});
  }

// the reason for passing into the iniit function is because it is the first function that is usually called when the app launches
  @override
  void initState() {
    // TODO: implement initState
    getontheload();
    super.initState();
  }

  Widget allCustomerDetails() {
    return StreamBuilder(
        stream: CustomerStream,
        builder: (context, AsyncSnapshot snapshot) {
          //snapshot will check if the data present in a respective collection or not
          //if there's a data or document in the respective collection, it will show all the respective data in the ListView, if not it will just show a container here
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Name : ' + ds["Name"],
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      namecontroller.text = ds["Name"];
                                      phonecontroller.text = ds["Phone"];
                                      // Parse date string from Firestore document
                                      String dateString = ds["Date"];
                                      List<String> dateParts = dateString.split(
                                          '/'); // Assuming date format is "day/month/year"
                                      int day = int.parse(dateParts[0]);
                                      int month = int.parse(dateParts[1]);
                                      int year = int.parse(dateParts[2]);
                                      _selectedDate =
                                          DateTime(year, month, day);

                                      // Parse time string from Firestore document
                                      String timeString = ds["Time"];
                                      List<String> timeParts = timeString.split(
                                          ':'); // Assuming time format is "hour:minute AM/PM"
                                      int hour = int.parse(timeParts[0]);
                                      int minute = int.parse(timeParts[1]
                                              .split(' ')[
                                          0]); // Extract minute before AM/PM
                                      String period = timeParts[1]
                                          .split(' ')[1]; // Extract AM/PM
                                      if (period == 'PM' && hour < 12) {
                                        hour +=
                                            12; // Convert to 24-hour format if PM
                                      } else if (period == 'AM' && hour == 12) {
                                        hour = 0; // Convert 12 AM to 0 hour
                                      }
                                      _selectedTime =
                                          TimeOfDay(hour: hour, minute: minute);

                                      // Call the edit dialog with updated values
                                      EditCustomerDetails(ds["Id"]);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  GestureDetector(
                                    child:
                                        Icon(Icons.delete, color: Colors.red),
                                    onTap: () async {
                                      await DatabaseMethods()
                                          .deleteCustomerDetails(ds['Id']);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                'Phone :' + ds["Phone"],
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Date :' + ds["Date"],
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Time :' + ds["Time"],
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ReservationForm();
                },
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'All',
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
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            children: [
              Expanded(child: allCustomerDetails()),
            ],
          ),
        ),
        // delete yan
      ),
    );
  }

  //Edit
  Future EditCustomerDetails(String id) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.cancel),
                    ),
                    SizedBox(
                      width: 60.0,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
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
                    fontSize: 20.0,
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
                            fontSize: 18,
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
                              size: 25.0,
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
                                fontSize: 25,
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
                            fontSize: 18,
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
                              size: 25.0,
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
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> updateInfo = {
                            "Name": namecontroller.text,
                            "Phone": phonecontroller.text,
                            "Id": id,
                            "Date":
                                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'
                                    .toString(),
                            "Time": _selectedTime.format(context).toString(),
                          };
                          await DatabaseMethods()
                              .updateCustomerDetails(id, updateInfo)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        },
                        child: Text('Update'))),
              ],
            ),
          ),
        ),
      );
}
