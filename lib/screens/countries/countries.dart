import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/provider/country_provider/country_provider.dart';
import 'package:maqqi/screens/countries/country_form.dart';
import 'package:maqqi/screens/countries/widgets/country_error.dart';
import 'package:maqqi/screens/countries/widgets/country_list_view.dart';
import 'package:maqqi/services/graphql_service/countries_service/graphql/queries/country_queries.dart';
import 'package:maqqi/services/graphql_service/graphql_client.dart';
import 'package:provider/provider.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Config.initializeSubscriptionClient("hello"),
      child: CacheProvider(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text("Countries"),
          ),
          body: Subscription(
            options: SubscriptionOptions(
              document: gql(getCountryBySubscription),
            ),
            builder: (result) => result.isLoading
                ? const Center(
                    child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 20),
                  ))
                : result.hasException
                    ? GraphQLErrorMessage(
                        graphqlError: result.exception.toString())
                    : CountriesListView(
                        countries: getCountriesFromResult(result),
                        resultObject: result,
                      ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.add),
            onPressed: () {
              // show country form
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CountryForm();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Country> getCountriesFromResult(QueryResult<Object?> resultObject) {
    final List<Object?> countries = resultObject.data!['country'];
    return countries.map((country) {
      return Country.fromJson(json.decode(json.encode(country)));
    }).toList();
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
