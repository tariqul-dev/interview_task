import 'package:flutter/material.dart';
import 'package:interview_rest/views/home-page/home_page.dart';

class InterviewRestApp extends StatelessWidget {
  const InterviewRestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
      },
    );
  }
}
