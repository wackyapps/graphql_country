import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:maqqi/model/country/country.dart';

class CountriesListView extends StatelessWidget {
  const CountriesListView(
      {Key? key, required this.countries, required this.resultObject})
      : super(key: key);

  final List<Country?> countries;
  // final String? countries;
  final QueryResult<Object?> resultObject;

  @override
  Widget build(BuildContext context) {
    print('json result: ${resultObject.data}');
    return Container(
      child:
          // Text(countries!),
          ListView.builder(
              itemCount: countries.length,
              itemBuilder: ((context, index) {
                print('index list view: $index');
                final Country country = countries[index]!;
                return ListTile(
                  title: Text(country.Name.toString()),
                  subtitle: Text(
                      '${country.CountryCode.toString()} - ${country.Currency} - ${country.Capital}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // ignore: avoid_print
                      print('${country.Name}');
                    },
                  ),
                );
              })),
    );
  }
}
