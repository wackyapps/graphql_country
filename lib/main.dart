import 'package:flutter/material.dart';
import 'package:maqqi/model/country/country.dart';
import 'package:maqqi/services/graphql_service/countries_service/countries_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _loading = false;

  void _fetchCountriesAll() {
    setState(() {
      _counter= 0;
      _loading = true;
    });
    CountriesService service = CountriesService();
    service.getCountries().then((List<Country> countries) {
      // loop countries and print
      for (Country country in countries) {
        print('country: ${country.Name}');
        _counter++;
      }
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_loading) ? const Text('Loading...') : Text('Countries: $_counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchCountriesAll,
        tooltip: 'Countries',
        child: const Icon(Icons.download),
      ),
    );
  }
}
