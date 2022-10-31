import 'package:flutter/material.dart';
import 'package:interview_rest/providers/country_provider.dart';
import 'package:interview_rest/views/interview_rest.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CountryProvider() ..getAllCountryInfo(),
      child: const InterviewRestApp(),
    ),
  );
}
