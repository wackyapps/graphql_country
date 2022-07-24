import 'package:flutter/material.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/provider/country_provider/country_provider.dart';
import 'package:maqqi/screens/countries/country_form.dart';
import 'package:provider/provider.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Countries"),
      ),
      body: ListView.builder(
        itemCount: Provider.of<CountryProvider>(context, listen: true)
            .countries
            .length,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text("Country Name, Capital, Currency"),
            subtitle: const Text("Phone Code, Latitude, Longitude"),
            leading: IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.red),
              onPressed: () {
                // alert dialog
                showDeleteDialog(context, index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          // show country form
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CountryForm();
          }));
        },
      ),
    );
  }

  showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete"),
        content: const Text("Are you sure you want to delete?"),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () {
              // delete country from provider and provider delete form list and service
              Provider.of<CountryProvider>(context, listen: false)
                  .deleteCountry(index)
                  .then((Country deletedCountry) {
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
