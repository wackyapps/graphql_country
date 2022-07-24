// country form
import 'package:flutter/material.dart';

class CountryForm extends StatefulWidget {
  const CountryForm({Key? key}) : super(key: key);

  @override
  _CountryFormState createState() => _CountryFormState();
}

class _CountryFormState extends State<CountryForm> {
  final TextStyle textstyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  // name controller
  final TextEditingController _nameController = TextEditingController();
  // capital controller
  final TextEditingController _capitalController = TextEditingController();
  // currency controller
  final TextEditingController _currencyController = TextEditingController();
  // latitude controller
  final TextEditingController _latitudeController = TextEditingController();
  // longitude controller
  final TextEditingController _longitudeController = TextEditingController();
  // phone code controller
  final TextEditingController _phoneCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: inputDecoration('Name', 'Enter name'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _capitalController,
                    decoration: inputDecoration('Capital', 'Enter capital'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _currencyController,
                    decoration:
                        inputDecoration('Currency', 'Enter currency symbol'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _phoneCodeController,
                    decoration:
                        inputDecoration('Phone Code', 'Enter phone code'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _latitudeController,
                    decoration: inputDecoration(
                        'Latitude', 'Enter Latitude Coordinates'),
                    initialValue: '0.0',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _longitudeController,
                    decoration: inputDecoration(
                        'Longitude', 'Enter Longitude Coordinates'),
                    initialValue: '0.0',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    color: Colors.orange,
                    minWidth: 160,
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: textstyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String text, String hint,
      {String value = ""}) {
    return InputDecoration(
      border: OutlineInputBorder(),
      hintText: hint,
      label: Text(text),
    );
  }
}
