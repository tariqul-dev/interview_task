import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview_rest/models/country_model.dart';

class CountryApi {
  static Future<List<CountryModel>> getAllCountryInfo() async {
    var request = Request('GET',
        Uri.parse('https://vipankumar.com/SmartHealth/api/getCountries'));

    try {
      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var encodedData = await response.stream.bytesToString();
        var decodedData = jsonDecode(encodedData);

        List<CountryModel> countries = List.generate(decodedData['data']['countries'].length,
            (index) => CountryModel.fromJson(decodedData['data']['countries'][index]));
        return countries;
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (error) {
      debugPrint('error fetching data: $error');
      return [];
    }
  }
}
