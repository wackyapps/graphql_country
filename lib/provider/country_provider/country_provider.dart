import 'package:flutter/foundation.dart';
import 'package:maqqi/model/country/country.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> _countries = <Country>[];

  List<Country> get countries => _countries;

  set countries(List<Country> value) {
    _countries = value;
  }

  // add country
  void addCountry(Country country) {
    // ignore: todo
    // TODO: call database api service to add in graphql first
    _countries.add(country);
    notifyListeners();
  }

  // remove country
  void removeCountry(Country country) {
    // ignore: todo
    // TODO: call database api service to remove in graphql first
    _countries.remove(country);
    notifyListeners();
  }
}
