import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';

//Dropdown implementation use pub.dev package "dropdownfield2"
import 'package:dropdownfield2/dropdownfield2.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  late TextEditingController controller;
  String usernametext = '';

  // Checkbox implementation
  bool agreement_isChecked = false;

  //Snackbar implementation
  String msg = '';

  //Switch implementation
  bool isSwitched = false;

  //Radio button implementation
  String groupValue = 'Male';

  //Dropdown Implementation
  String selectedCountry = '';
  final countrySelected = TextEditingController();
  List<String> countryList = [
                'India',
                'USA',
                'China',
                'Japan',
                'Korea',
                'Russia',
                'Germany',
              ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  usernametext = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),

            // Checkbox Implementation

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: agreement_isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        agreement_isChecked = value!;
                      });
                    }),
                const Text("I read the agreement and accepted")
              ],
            ),

            //Switched implementation

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        msg = '';
                      });
                    }),
                const Text("Are you single?")
              ],
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Gender ?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                    const Text("Male"),
                    Radio(
                      value: 'Female',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                )
              ],
            ),

            //Dropdown implementation use pub.dev package "dropdownfield2"

            DropDownField(
              controller: countrySelected,
              hintText: 'Select your country',
              enabled: true,
              itemsVisibleInDropdown: 7,
              hintStyle: TextStyle(color: Colors.black),
              items: countryList,
              onValueChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                });
              },
            ),

            //Submit Button Implementation

            ElevatedButton(
                onPressed: () {
                  if (usernametext.isEmpty) {
                    msg = 'Please fill username';
                  } else if (!agreement_isChecked) {
                    msg = 'Please read the agreement and accept';
                  } else if (!isSwitched) {
                    msg = 'You are Single Right?';
                  } else if (groupValue == 'Male') {
                    msg = 'You are Male Right?';
                  } else if (selectedCountry.isEmpty) {
                    msg = 'Please select a country';
                  } else {
                    msg = 'Submitted Successfully';
                  }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(msg),
                    action: SnackBarAction(
                        label: msg == 'You are Single Right?' ||
                                msg == 'You are Male Right?'
                            ? 'Yes'
                            : '',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Submitted Successfully')));
                        }),
                  ));
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}
