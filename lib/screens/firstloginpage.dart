import 'dart:ui';

import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sushires_project/login/cashier_widget_tree.dart';
import 'package:sushires_project/login/kitchen_widget_tree.dart';
import 'package:sushires_project/login/waiter_widget_tree.dart';
import '../components/sushibarlogo.dart';

final List<String> items = [
  'Waiter',
  'Cashier',
  'Kitchen',
];
String? selectedValue;

List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  final List<DropdownMenuItem<String>> menuItems = [];
  for (final String item in items) {
    menuItems.addAll(
      [
        DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              item,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        //If it's last item, we will not add Divider after it.
        if (item != items.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(),
          ),
      ],
    );
  }
  return menuItems;
}

List<double> _getCustomItemsHeights() {
  final List<double> itemsHeights = [];
  for (int i = 0; i < (items.length * 2) - 1; i++) {
    if (i.isEven) {
      itemsHeights.add(50);
    }
    //Dividers indexes will be the odd indexes
    if (i.isOdd) {
      itemsHeights.add(4);
    }
  }
  return itemsHeights;
}

class FirstLogInPage extends StatefulWidget {
  const FirstLogInPage({super.key});

  @override
  State<FirstLogInPage> createState() => _FirstLogInPageState();
}

class _FirstLogInPageState extends State<FirstLogInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SushiBarLogo(),
              Image(
                image: AssetImage('images/logo.png'),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Role',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: _addDividersAfterItems(items),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    height: 60,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: Colors.grey,
                          width: 3,
                          style: BorderStyle.solid),
                    ),
                  ),
                  dropdownStyleData: const DropdownStyleData(
                    maxHeight: 200,
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    customHeights: _getCustomItemsHeights(),
                  ),
                  iconStyleData: const IconStyleData(
                    openMenuIcon: Icon(Icons.arrow_drop_up),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  // SISS HMUE YOU WILL FIX HERE
                  if (selectedValue == 'Waiter') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Waiter_WidgetTree(); // change with waiter home page later **
                        },
                      ),
                    );
                  } else if (selectedValue == 'Cashier') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Cashier_WidgetTree(); // change with cashier home page later **
                        },
                      ),
                    );
                  } else if (selectedValue == "Kitchen") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Kitchen_WidgetTree(); // change with waiter home page later **
                        },
                      ),
                    );
                  } else {
                    CustomAlertDialogBox.showCustomAlertBox(
                      context: context,
                      willDisplayWidget: Container(
                        child: Text('Select Role First'),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFCA652C),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
