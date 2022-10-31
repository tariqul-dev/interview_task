import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_rest/apis/country_api.dart';
import 'package:interview_rest/models/country_model.dart';

class CountryProvider extends ChangeNotifier {
  List<CountryModel> countries = [];
  int length = 0;
  Timer? timer;

  //  fetching all country info and storing in to countries list
  Future<void> getAllCountryInfo() async {
    countries = await CountryApi.getAllCountryInfo();
    length = countries.length;

    if (timer != null && timer!.isActive) {
      stopTimer();
      startTimer();
    } else {
      startTimer();
    }
    // deleteItem();
    notifyListeners();
  }

  //  deleting item in 10 seconds
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (countries.isNotEmpty) {
        countries.removeAt(0);
        length = countries.length;
      } else {
        stopTimer();
      }
      notifyListeners();
    });
  }

  stopTimer() {
    timer!.cancel();
  }
}
