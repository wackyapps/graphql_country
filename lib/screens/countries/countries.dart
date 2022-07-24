import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Countries"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text("Country Name, Capital, Currency"),
            subtitle: const Text("Phone Code, Latitude, Longitude"),
            leading: IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.red),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
